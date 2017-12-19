Rails.application.routes.draw do
  
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :passports do
  	get 'search', on: :collection
    get 'sub_search', on: :collection
  end

  #not signin and signin
  devise_scope :user do
    authenticated  do
      root 'passports#index'
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: 'unauthenticated_root'
    end
  end 
end

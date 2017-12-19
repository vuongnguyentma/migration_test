class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_sign_up_mail

  def send_sign_up_mail
  	BasicMailer.send_sign_up_mail(id).deliver
  end
end

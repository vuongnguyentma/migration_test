class Passport < ApplicationRecord
	validates :name, :employeeId, presence: true
	validates :email, confirmation: true
	validates :employeeId, uniqueness: true, :on => [:create]
	validates :passport, format: { with: /\A[A-Z]{1}[0-9]{5}+\z/}, allow_blank: true

	def self.search(search)
	  where('name LIKE :search OR project LIKE :search OR employeeId LIKE :search OR passport LIKE :search', search: "%#{search}%")
	end
end

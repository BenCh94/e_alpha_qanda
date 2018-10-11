class User < ApplicationRecord
	has_many :questions
	has_many :answers

	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :password, presence: true
	has_secure_password
end

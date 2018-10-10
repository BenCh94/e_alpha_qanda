class Question < ApplicationRecord
	belongs_to :user
	has_many :answers

	validates :title, presence: true
	validates :text, presence: true
	validates :user_id, presence: true
end

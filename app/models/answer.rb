class Answer < ApplicationRecord
	belongs_to :question
	belongs_to :user

	validates :text, presence: true
	validates :user_id, presence: true
end

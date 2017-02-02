class AnswerChoice < ApplicationRecord
  validates :question, :text, presence: true

  belongs_to :question
  has_many :responses
end

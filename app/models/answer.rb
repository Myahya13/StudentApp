# frozen_string_literal: true

class Answer < ApplicationRecord
  validates :content, presence: true
  validates :question_id, presence: true
  validates :correct, inclusion: { in: [true, false] }

  belongs_to  :question
  has_many    :attempted_questions
end

# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to  :question
  
  validates :content, presence: true
  validates :correct, inclusion: { in: [true, false] }

  has_many    :attempted_questions
end

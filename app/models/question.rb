# frozen_string_literal: true

class Question < ApplicationRecord
  validates :question_text, presence: true, length: { maximum: 255 }
  validates  :exam_id, presence: true
  validates  :correct, inclusion: { in: [true, false] }

  belongs_to :exam
  has_many :answers
end

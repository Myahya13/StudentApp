# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :exam
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers
  enum question_type: { text: 0, mcq: 1 }

  validates :question_text, presence: true, length: { maximum: 255 }
  validates  :exam_id, presence: true
  validates  :question_type, presence: true

  
end

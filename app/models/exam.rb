# frozen_string_literal: true

class Exam < ApplicationRecord
  validates  :title, presence: true, length: { maximum: 200 }
  validates  :description, presence: true
  validates  :marks, presence: true, numericality: { only_integer: true }
  validates  :show_exam, presence: true
  validates  :status, inclusion: { in: [true, false] }

  has_many :questions
  belongs_to  :user
  belongs_to  :subject
  has_many    :student_exams
  has_many    :attempted_questions, through: :student_exams
  has_many :users, through: :student_exams, source: :users
end

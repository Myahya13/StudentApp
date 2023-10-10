# frozen_string_literal: true

class User < ApplicationRecord
  has_many :exams
  has_many :student_exams
  has_many :attempted_questions, through: :student_exams

  validates :name, presence: true
  validates  :role, presence: true
  enum role: { admin: 0, teacher: 1, student: 2 }
  validates :profile_pictur, presence: true
end

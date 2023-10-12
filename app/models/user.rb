# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :exams
  has_many :student_exams
  has_many :attempted_questions, through: :student_exams
  has_one_attached :profile_picture

  validates :name, presence: true
  validates  :role, presence: true
  enum role: { admin: 0, teacher: 1, student: 2 }
  
end

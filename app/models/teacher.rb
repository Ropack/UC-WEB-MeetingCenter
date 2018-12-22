class Teacher < ApplicationRecord
  has_many :lessons
  has_many :teacher_assignments, dependent: :destroy
  has_many :courses, through: :teacher_assignments
end

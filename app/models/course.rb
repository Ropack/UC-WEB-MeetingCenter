class Course < ApplicationRecord
  extend Enumerize

  has_many :lessons, dependent: :destroy

  has_many :teacher_assignments, dependent: :destroy
  has_many :teachers, through: :teacher_assignments

  has_many :student_assignments, dependent: :destroy
  has_many :students, through: :student_assignments

  validates :title, presence: true

  enumerize :language, in: [:czech, :english], default: :czech
  enumerize :study_type, in: [:full_time, :part_time], default: :full_time
end

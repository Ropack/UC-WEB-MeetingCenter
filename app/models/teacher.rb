class Teacher < ApplicationRecord
  has_many :lessons
  has_many :teacher_assignments, dependent: :destroy
  has_many :courses, through: :teacher_assignments


  scope :by_course_id, -> (course_id) { TeacherAssignment.where(course_id: course_id).includes(:teacher) }

  def full_name
    "#{first_name} #{last_name}"
  end
end

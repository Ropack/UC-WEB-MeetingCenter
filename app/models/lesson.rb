class Lesson < ApplicationRecord
  belongs_to :room
  belongs_to :teacher
  belongs_to :course
end

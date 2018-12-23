class Lesson < ApplicationRecord
  belongs_to :room
  belongs_to :teacher
  belongs_to :course


  def day

  end

  scope :today, -> { where(start_at: Time.now.midnight..(Time.now.midnight+1.day)).order(:start_at).includes(:teacher, :room, :course) }

  def progress
    (Time.now - self.start_at) / (self.end_at - self.start_at) * 100
  end
end

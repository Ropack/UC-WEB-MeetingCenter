class Room < ApplicationRecord
  belongs_to :building
  has_many :lessons
  validates :title, presence: true

  scope :by_building_id, -> (building_id) { where(building_id: building_id).includes(:building) }

  def full_name
    "#{code} - #{title}"
  end
end

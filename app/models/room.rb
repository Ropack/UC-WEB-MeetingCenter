class Room < ApplicationRecord
  belongs_to :building
  has_many :lessons

  scope :by_building_id, -> (building_id) { where(building_id: building_id) }
end

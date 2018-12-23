class Building < ApplicationRecord
  has_many :rooms, dependent: :destroy
  validates :title, presence: true

  def full_name
    "#{code} - #{title}"
  end
end

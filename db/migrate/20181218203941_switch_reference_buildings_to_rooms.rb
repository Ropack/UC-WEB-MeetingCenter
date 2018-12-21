class SwitchReferenceBuildingsToRooms < ActiveRecord::Migration[5.1]
  def change
    remove_reference :buildings, :room, foreign_key: true
    add_reference :rooms, :building, foreign_key: true
  end
end

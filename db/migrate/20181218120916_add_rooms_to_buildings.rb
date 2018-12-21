class AddRoomsToBuildings < ActiveRecord::Migration[5.1]
  def change
    add_reference :buildings, :room, foreign_key: true
  end
end

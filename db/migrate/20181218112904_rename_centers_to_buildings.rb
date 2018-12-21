class RenameCentersToBuildings < ActiveRecord::Migration[5.1]
  def change
    rename_table :centers, :buildings
  end
end

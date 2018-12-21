class CreateCenters < ActiveRecord::Migration[5.1]
  def change
    create_table :centers do |t|

      t.string :title
      t.string :code

      t.timestamps
    end
  end
end

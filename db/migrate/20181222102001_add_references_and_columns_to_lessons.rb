class AddReferencesAndColumnsToLessons < ActiveRecord::Migration[5.1]
  def change
    add_reference :lessons, :teacher, foreign_key: true
    add_reference :lessons, :course, foreign_key: true
    add_reference :lessons, :room, foreign_key: true

    add_column :lessons, :start_at, :datetime
    add_column :lessons, :end_at, :datetime
    add_column :lessons, :duration, :integer
  end
end

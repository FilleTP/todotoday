class CreateLevels < ActiveRecord::Migration[7.0]
  def change
    create_table :levels do |t|
      t.string :name
      t.integer :min_points
      t.string :description

      t.timestamps
    end
  end
end

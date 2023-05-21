class CreateTaskLists < ActiveRecord::Migration[7.0]
  def change
    create_table :task_lists do |t|
      t.integer :points
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end

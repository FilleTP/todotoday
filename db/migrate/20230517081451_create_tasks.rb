class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.string :name
      t.integer :priority
      t.float :points
      t.boolean :completed, default: false
      t.references :task_list, null: false, foreign_key: true
      t.references :task_category, null: true, foreign_key: true

      t.timestamps
    end
  end
end

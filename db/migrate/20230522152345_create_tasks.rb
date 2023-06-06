class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.boolean :completed, default: false
      t.integer :priority, default: 0
      t.integer :points, default: 10
      t.references :task_list, null: false, foreign_key: true
      t.references :task_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end

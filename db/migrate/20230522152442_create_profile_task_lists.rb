class CreateProfileTaskLists < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_task_lists do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :task_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :nickname
      t.float :points, default: 0
      t.integer :streak
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

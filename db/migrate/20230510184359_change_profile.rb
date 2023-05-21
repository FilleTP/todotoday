class ChangeProfile < ActiveRecord::Migration[7.0]
  def change
    add_reference :profiles, :level, foreign_key: true
  end
end

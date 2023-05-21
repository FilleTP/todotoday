class AddDefaultValuePointsProfile < ActiveRecord::Migration[7.0]
  def change
    change_column :profiles, :points, :integer, default: 0
  end
end

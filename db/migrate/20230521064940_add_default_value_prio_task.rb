class AddDefaultValuePrioTask < ActiveRecord::Migration[7.0]
  def change
    change_column :tasks, :priority, :integer, default: 0
  end
end

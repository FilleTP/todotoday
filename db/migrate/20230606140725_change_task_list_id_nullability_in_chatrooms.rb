class ChangeTaskListIdNullabilityInChatrooms < ActiveRecord::Migration[7.0]
  def change
    change_column_null :chatrooms, :task_list_id, true
    add_column :chatrooms, :type, :integer, default: 0
  end
end

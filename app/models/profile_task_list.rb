class ProfileTaskList < ApplicationRecord
  belongs_to :profile
  belongs_to :task_list
end

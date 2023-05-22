class TaskList < ApplicationRecord
  has_many :profile_task_lists
  has_many :profiles, through: :profile_task_lists
  has_many :tasks
end

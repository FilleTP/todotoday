class Task < ApplicationRecord
  belongs_to :task_list
  belongs_to :task_category
end

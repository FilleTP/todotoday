class Task < ApplicationRecord
  belongs_to :task_list
  belongs_to :task_category
  validates :task_category, presence: true
  enum :priority, %i[low high]
end

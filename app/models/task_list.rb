class TaskList < ApplicationRecord
  belongs_to :profile
  has_many :tasks
  accepts_nested_attributes_for :tasks
end

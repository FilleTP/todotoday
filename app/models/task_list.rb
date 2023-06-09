class TaskList < ApplicationRecord
  belongs_to :profile
  has_one :chatroom, dependent: :destroy
  has_many :profile_task_lists, dependent: :destroy
  has_many :profiles, through: :profile_task_lists
  has_many :tasks, dependent: :destroy
  has_many :invitations, dependent: :destroy
end

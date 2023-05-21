class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :level
  has_many :task_lists
  validates :nickname, presence, uniqueness
end

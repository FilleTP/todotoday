class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :level
  has_many :task_lists
  validates :nickname, presence: true, uniqueness: true
  before_validation :add_level, on: :create

  def add_level
    self.level ||= Level.find_by(name: "one")
  end

end

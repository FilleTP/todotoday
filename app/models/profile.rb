class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :level
  has_many :profile_task_lists
  has_many :task_lists, through: :profile_task_lists
  has_many :invitations_sent, foreign_key: 'inviter_id', class_name: 'Invitation'
  has_many :invitations_received, foreign_key: 'invitee_id', class_name: 'Invitation'
  has_many :messages
  validates :nickname, presence: true, uniqueness: true
  before_validation :add_level, on: :create

  def add_level
    self.level ||= Level.find_by(name: "one")
  end

end

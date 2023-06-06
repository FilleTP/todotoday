class Invitation < ApplicationRecord
  belongs_to :inviter, class_name: 'Profile'
  belongs_to :invitee, class_name: 'Profile'
  belongs_to :task_list
  after_create :generate_token

  def generate_token
    self.token = SecureRandom.hex(10)
    self.save
  end
end

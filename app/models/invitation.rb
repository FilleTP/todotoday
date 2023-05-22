class Invitation < ApplicationRecord
  belongs_to :inviter, class_name: 'Profile'
  belongs_to :invitee, class_name: 'Profile'
  belongs_to :task_list
end

class Message < ApplicationRecord
  belongs_to :profile
  belongs_to :chatroom
end

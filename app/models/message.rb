# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  content    :text
#  user_id    :bigint           not null
#  chat_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Model representing a message sent within a chat room.
class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  validates :content, presence: true
end

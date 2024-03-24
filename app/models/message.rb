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
  include ActionView::RecordIdentifier

  belongs_to :user
  belongs_to :chat

  validates :content, presence: true

  scope :with_user, ->{ includes(:user) }
  scope :ordered, ->{ order(created_at: :desc) }

  def broadcast_created
    broadcast_prepend_to(
      dom_id(chat, :messages),
      partial: 'messages/message',
      locals: { message: self, scroll_to: true },
      target: dom_id(chat, :messages)
    )
  end

  def same_user_as(given_user)
    self.user == given_user
  end
end

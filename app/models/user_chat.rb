# == Schema Information
#
# Table name: user_chats
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  chat_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Model representing the association between users and chats,
# indicating which users are participating in which chats.
class UserChat < ApplicationRecord
  belongs_to :user
  belongs_to :chat
end

# == Schema Information
#
# Table name: chats
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Model representing a chat room where users can exchange messages.
class Chat < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :user_chats, dependent: :destroy
  has_many :users, through: :user_chats

  accepts_nested_attributes_for :user_chats, :messages

  validates :name, presence: true
end

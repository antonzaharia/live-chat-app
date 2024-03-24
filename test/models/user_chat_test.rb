require "test_helper"

class UserChatTest < ActiveSupport::TestCase
  def setup
    @user = users(:anton)
    @chat = chats(:one)
  end

  test "should belong to user" do
    user_chat = UserChat.new(user: @user, chat: @chat)
    assert_respond_to user_chat, :user
  end

  test "should belong to chat" do
    user_chat = UserChat.new(user: @user, chat: @chat)
    assert_respond_to user_chat, :chat
  end
end

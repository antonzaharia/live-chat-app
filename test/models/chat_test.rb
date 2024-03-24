require "test_helper"

class ChatTest < ActiveSupport::TestCase
  setup do
    @chat = chats(:one)
  end

  test "should not save chat without name" do
    chat = Chat.new
    assert_not chat.save, "Saved the chat without a name"
  end

  test "should have many messages" do
    assert_respond_to @chat, :messages
  end

  test "should have many user_chats" do
    assert_respond_to @chat, :user_chats
  end

  test "should have many users through user_chats" do
    assert_respond_to @chat, :users
  end
end

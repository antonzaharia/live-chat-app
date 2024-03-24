require "test_helper"

class MessageTest < ActiveSupport::TestCase
  def setup
    @user = users(:anton)
    @chat = chats(:one)
  end

  test "should not save message without content" do
    message = Message.new(user: @user, chat: @chat)
    assert_not message.save, "Saved the message without content"
  end

  test "should save message with content" do
    message = Message.new(content: "Test Content", user: @user, chat: @chat)
    assert message.save, "Failed to save the message with content"
  end

  test "should belong to user" do
    message = Message.new(content: "Test Content", user: @user, chat: @chat)
    assert_respond_to message, :user
  end

  test "should belong to chat" do
    message = Message.new(content: "Test Content", user: @user, chat: @chat)
    assert_respond_to message, :chat
  end
end

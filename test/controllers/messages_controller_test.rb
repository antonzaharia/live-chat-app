require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chat = chats(:one)
    @user = sign_in_as(users(:anton))
  end

  test "should create message" do
    assert_difference('Message.count') do
      post chat_messages_url(@chat), params: { message: { content: "Test content" } }
    end

    assert_redirected_to chat_path(@chat)
  end

  test "should not create invalid message" do
    assert_no_difference('Message.count') do
      post chat_messages_url(@chat), params: { message: { content: nil } }
    end

    assert_response :unprocessable_entity
  end
end

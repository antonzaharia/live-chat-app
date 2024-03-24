require "test_helper"

class ChatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = sign_in_as(users(:anton))
    @chat = chats(:one)
  end

  test "should get show" do
    get chat_url(@chat)
    assert_response :success
  end

  test "should get new" do
    get new_chat_url
    assert_response :success
  end

  test "should create chat" do
    assert_difference('Chat.count') do
      post chats_url, params: { chat: { name: @chat.name } }
    end

    assert_redirected_to root_path
  end

  test "should not create invalid chat" do
    assert_no_difference('Chat.count') do
      post chats_url, params: { chat: { name: nil } }
    end

    assert_response :unprocessable_entity
  end
end

require 'test_helper'

class UserChatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = sign_in_as(users(:anton))
    @user_chat = user_chats(:one)
  end

  test "should destroy user_chat" do
    assert_difference('UserChat.count', -1) do
      delete user_chat_url(@user_chat)
    end

    assert_redirected_to root_path
    assert_equal "You've left the conversation.", flash[:notice]
  end
end

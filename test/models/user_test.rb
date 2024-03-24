require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:anton)
  end

  test "should have many messages" do
    assert_respond_to @user, :messages
  end

  test "should have many user_chats" do
    assert_respond_to @user, :user_chats
  end

  test "should have many chats through user_chats" do
    assert_respond_to @user, :chats
  end

  test "should have many sessions" do
    assert_respond_to @user, :sessions
  end

  test "name should be present" do
    @user.name = nil
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = nil
    assert_not @user.valid?
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email should be formatted correctly" do
    @user.email = "invalid_email"
    assert_not @user.valid?
  end

  test "password should have a minimum length of 4 characters" do
    @user.password = "123"
    assert_not @user.valid?
  end

  test "icon_text should return the first letter of the user's email capitalized" do
    assert_equal @user.icon_text, @user.name.first.upcase
  end

  test "should normalize email before validation" do
    @user.email = "  TEST@example.com  "
    @user.valid?
    assert_equal @user.email, "test@example.com"
  end

  test "verified should be false if email changed" do
    @user.email = "new_email@example.com"
    @user.valid?
    assert_equal @user.verified, false
  end

  test "should delete all sessions except current one after password update" do
    session1 = Session.create(user: @user)
    session2 = Session.create(user: @user)
    Current.session = session2
    @user.update(password: "new_password")
    assert_equal @user.sessions.count, 1
    assert_equal @user.sessions.first, session2
  end
end

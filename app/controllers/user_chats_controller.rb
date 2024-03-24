class UserChatsController < ApplicationController
  before_action :set_user_chat

  def destroy
    @user_chat.destroy!

    respond_to do |format|
      format.html { redirect_to root_path, notice: "You've left the conversation." }
    end
  end

  private

  def set_user_chat
    @user_chat = Current.user.user_chats.find(params[:id])
  end
end

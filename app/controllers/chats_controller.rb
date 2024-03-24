class ChatsController < ApplicationController
  before_action :set_chat, only: [:show]

  def show
    @user_chat = @chat.user_chats.find_by(user_id: Current.user)

    redirect_to root_path unless @user_chat
  end

  def new
    @chat = Current.user.chats.new
    @chat.messages.build
    @chat.user_chats.build(user: Current.user)
  end

  def create
    @chat = Current.user.chats.new(chat_params)
    @chat.user_chats.build(user: Current.user)

    if @chat.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def chat_params
    params.require(:chat).permit(
      :name,
      messages_attributes: [:content, :user_id],
      user_chats_attributes: [:id, :user_id]
    )
  end

  def set_chat
    @chat = Chat.find(params[:id])
  end
end

class MessagesController < ApplicationController
  before_action :set_chat

  def new
    @message = Message.new(user: Current.user)
  end

  def create
    @message = @chat.messages.new(**message_params, user: Current.user)

    if @message.save
      @message.broadcast_created

      respond_to do |format|
        format.html { redirect_to chat_path(@chat) }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end
end

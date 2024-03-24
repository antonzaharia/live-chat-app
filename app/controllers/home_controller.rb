class HomeController < ApplicationController
  def index
    @chats = Current.user.chats.order(created_at: :desc)
  end
end

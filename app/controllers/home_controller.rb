class HomeController < ApplicationController
  def index
    @chats = Current.user.chats.ordered.with_users
  end
end

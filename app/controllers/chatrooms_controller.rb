class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def index
    @chatrooms = Chatroom.all
  end

  def create
    @exchange = Exchange.find(params[:exchange_id])
    @chatroom = Chatroom.create(exchange: @exchange, name: "general")
    redirect_to chatroom_path(@chatroom)
  end
end

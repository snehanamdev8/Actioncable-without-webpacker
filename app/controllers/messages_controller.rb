class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save
    data = {
      content: @message.content,
      email: @message.user.email
    }
    ActionCable.server.broadcast 'room_channel', data
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id, :room_id)
  end
end
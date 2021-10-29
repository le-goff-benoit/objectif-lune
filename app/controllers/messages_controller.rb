class MessagesController < ApplicationController
  def new
    @message = Message.new
    @channel = Channel.find(params[:channel_id])
  end

  def create
    @message = Message.new(params.require(:message).permit(:text))
    @message.channel = Channel.find(params[:channel_id])
    @message.user = current_user
    if @message.save
      redirect_to @message.channel
    end
  end

  def show

  end
end
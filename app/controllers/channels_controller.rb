class ChannelsController < ApplicationController
  def show
    @channel = Channel.find(params[:id])
    @messages = @channel.messages.order(created_at: :desc).limit(15)
  end
end
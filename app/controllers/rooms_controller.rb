class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @messages = @room.messages.order("id DESC")
  end
end

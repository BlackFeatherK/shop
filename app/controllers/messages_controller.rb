class MessagesController < ApplicationController

  before_action :set_room

  def create
    @message = @room.messages.new( :content => params[:message][:content] )
    @message.user = current_user

    # data = { :content => @message.content , :created_at => @message.created_at , :user_name => "Foobar" }
    html = ApplicationController.renderer.render( :partial => "messages/message" , :locals => { :message => @message } )

    ActionCable.server.broadcast( "room_#{@room.id}" , html)

    render :js => '$("#messages_content").val("");'
                  
  end

  protected

  def set_room
    @room = Room.find( params[:room_id] )
  end

end

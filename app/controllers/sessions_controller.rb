class SessionsController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def create
    
    room = Room.find_by(name: params[:session][:name].downcase)
    if room && room.authenticate(params[:session][:password])
      log_in room
      redirect_to room_grouplists_path(room)
    else
      flash.now[:alert] = 'ルーム名orルームキーが間違っています'
      render 'new' 
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to rooms_path
  end

end

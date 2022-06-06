class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @rooms = Room.all.order(created_at: 'desc')
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render :index
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to rooms_path
  end





  private 
  def room_params
    params.require(:room).permit(:name, :password, :password_confirmation, :user).merge(user_id: current_user.id)
  end
end

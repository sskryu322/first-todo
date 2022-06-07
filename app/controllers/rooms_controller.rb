class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @rooms = Room.all.order(created_at: 'desc')
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @rooms = Room.all.order(created_at: 'desc')
    if @room.user_id == current_user.id && @room.save
      redirect_to rooms_path
    else
      render :index
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to rooms_path
    else
      render :edit
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

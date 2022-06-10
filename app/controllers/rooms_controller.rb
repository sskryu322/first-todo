class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rooms, only: [:index, :create]
  before_action :set_room, only: [:edit, :update]

  def index
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.user_id == current_user.id && @room.save
      redirect_to rooms_path
    else
      render :index
    end
  end

  def edit
  end

  def update
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

  # 検索機能
  def search
    @rooms = Room.search(params[:keyword]).order(created_at: 'desc')
    @room = Room.new
  end

  private

  def set_rooms
    @rooms = Room.all.order(created_at: 'desc')
  end

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :password, :password_confirmation, :user).merge(user_id: current_user.id)
  end
end

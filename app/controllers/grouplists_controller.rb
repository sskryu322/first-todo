class GrouplistsController < ApplicationController
  before_action :logged_in_room
  before_action :authenticate_user!
  before_action :set_room
  before_action :set_grouplist, only: [:edit, :show, :update, :destroy]

  def index
    @grouplist = Grouplist.new
    @grouplists = Grouplist.where(room_id: @room.id).order(start_time: 'asc')
  end

  def edit
  end

  def create
    @grouplist = Grouplist.new(grouplists_params)
    @grouplists = Grouplist.where(room_id: @room.id)
    if @grouplist.room_id == @room.id && @grouplist.save
      flash[:notice] = '♫予定を登録しました♫'
      redirect_to room_grouplists_path(@room.id)
    else
      flash.now[:alert] = 'タイトルを正しく入力してください'
      render :index
    end
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(grouplist_id: @grouplist.id, room_id: @grouplist.room_id).order(updated_at: 'desc')
  end

  def update
    if @grouplist.update(grouplists_params)
      flash[:notice] = '♫予定を更新しました♫'
      redirect_to room_grouplists_path(@room.id)
    else
      render :edit
    end
  end

  def destroy
    @grouplist.destroy
    flash[:notice] = '予定を削除しました'
    redirect_to room_grouplists_path(@room.id)
  end

  private
  

  def grouplists_params
    params.require(:grouplist).permit(:title, :start_time, :text, :user, :room, main_images: []).merge(user_id: current_user.id,
                                                                                              room_id: @room.id)
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_grouplist
    @grouplist = Grouplist.find(params[:id])
  end

  def logged_in_room
    @room = Room.find(params[:room_id])
    redirect_to login_path unless logged_in? && current_room.id == @room.id
  end
end

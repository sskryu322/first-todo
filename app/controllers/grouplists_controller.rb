class GrouplistsController < ApplicationController
  before_action :authenticate_user!

  def index
    @grouplist = Grouplist.new
    @room = Room.find(params[:room_id])
    @grouplists = Grouplist.where(room_id: @room.id).order(start_time: 'asc')
  end

  def edit
    @room = Room.find(params[:room_id])
    @grouplist = Grouplist.find(params[:id])
  end

  def create
    @room = Room.find(params[:room_id])
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
    @room = Room.find(params[:room_id])
    @grouplist = Grouplist.find(params[:id])
  end

  def update
    @room = Room.find(params[:room_id])
    @grouplist = Grouplist.find(params[:id])
    if @grouplist.update(grouplists_params)
      flash[:notice] = '♫予定を更新しました♫'
      redirect_to room_grouplists_path(@room.id)
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:room_id])
    @grouplist = Grouplist.find(params[:id])
    @grouplist.destroy
    flash[:notice] = '予定を削除しました'
    redirect_to room_grouplists_path(@room.id)
  end

  def grouplists_params
    params.require(:grouplist).permit(:title, :start_time, :text, :user, :room, :image).merge(user_id: current_user.id,
                                                                                              room_id: @room.id)
  end
end

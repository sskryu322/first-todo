class CommentsController < ApplicationController
  before_action :logged_in_room
  before_action :authenticate_user!
  before_action :set_room, only: [:create, :edit, :update, :destroy]
  before_action :set_grouplist, only: [:create, :edit, :update, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    @comments = Comment.where(room_id: @room.id).order(updated_at: 'desc')
    if @grouplist.room_id == @room.id && @comment.save
      flash[:notice] = '♫コメントを投稿しました♫'
      redirect_to room_grouplist_path(@room, @grouplist)
    else
      flash.now[:alert] = '入力されていませんor200字を超えています'
      redirect_to room_grouplist_path(@room, @grouplist)
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = '♫コメントを更新しました♫'
      redirect_to room_grouplist_path(@room, @grouplist)
    else
      render 'grouplists/edit'
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = 'コメントを削除しました'
    redirect_to room_grouplist_path(@room, @grouplist)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user, :grouplist, :room).merge(user_id: current_user.id,
                                                                           grouplist_id: params[:grouplist_id], room_id: params[:room_id])
  end

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_grouplist
    @grouplist = Grouplist.find(params[:grouplist_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def logged_in_room
    @room = Room.find(params[:room_id])
    redirect_to login_path unless logged_in? && current_room.id == @room.id
  end
end

class CommentsController < ApplicationController
  before_action :logged_in_room
  before_action :authenticate_user!

  def create
    @room = Room.find(params[:room_id])
    @grouplist = Grouplist.find(params[:grouplist_id])
    @comment = Comment.new(comment_params)
    @comments = Comment.where(room_id: @room.id).order(updated_at: 'desc')
    if @grouplist.room_id == @room.id && @comment.save
      flash[:notice] = '♫コメントを投稿しました♫'
      redirect_to room_grouplist_path(@room, @grouplist)
    else
      render 'grouplists/show'
    end
  end

  def edit
    @room = Room.find(params[:room_id])
    @grouplist = Grouplist.find(params[:grouplist_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @room = Room.find(params[:room_id])
    @grouplist = Grouplist.find(params[:grouplist_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = '♫コメントを更新しました♫'
      redirect_to room_grouplist_path(@room, @grouplist)
    else
      render 'grouplists/edit'
    end
  end

  def destroy
    @room = Room.find(params[:room_id])
    @grouplist = Grouplist.find(params[:grouplist_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = 'コメントを削除しました'
    redirect_to room_grouplist_path(@room, @grouplist)
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :user, :grouplist, :room).merge(user_id: current_user.id, grouplist_id: params[:grouplist_id], room_id: params[:room_id])
  end

  def logged_in_room
    @room = Room.find(params[:room_id])
    unless logged_in? && current_room.id == @room.id
      redirect_to login_path
    end
  end
end

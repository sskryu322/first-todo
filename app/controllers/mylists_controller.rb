class MylistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mylist, only: [:edit, :show, :ensure_correct_customer]
  before_action :move_to_index, only: [:show, :edit, :update, :destroy]
  before_action :ensure_correct_customer, only: [:edit, :update, :destroy]

  def index
    @mylist = Mylist.new
    @user = current_user
    @mylists = Mylist.where(user_id: current_user).order(start_time: 'asc')
  end

  def edit
  end

  def create
    @mylist = Mylist.new(mylists_params)
    @user = current_user
    @mylists = Mylist.where(user_id: current_user)
    if @mylist.user_id == current_user.id && @mylist.save
      flash[:notice] = '♫予定を登録しました♫'
      redirect_to mylists_path
    else
      flash.now[:alert] = 'タイトルを正しく入力してください'
      render :index
    end
  end

  def update
    if @mylist.update(mylists_params)
      flash[:notice] = '♫予定を更新しました♫'
      redirect_to mylists_path(params[:id])
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @mylist.destroy
    flash[:notice] = '予定を削除しました'
    redirect_to mylists_path
  end

  private

  def set_mylist
    @mylist = Mylist.find(params[:id])
  end

  def ensure_correct_customer
    redirect_to mylists_path unless @mylist.user_id == current_user.id
  end

  def mylists_params
    params.require(:mylist).permit(:title, :start_time, :text, :user, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @mylist = Mylist.find(params[:id])
    redirect_to action: :index unless current_user.id == @mylist.user_id
  end
end

class MylistsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :edit, :destroy]
  

  def index
    @mylist = Mylist.new
    @user = current_user
    @mylists = Mylist.where(user_id: current_user).order(start_time: "asc")
  end

  def create
    mylist = Mylist.new(mylists_params)
    if  mylist.user_id = current_user.id
      mylist.save
        flash[:notice] = "予定を登録しました"
        redirect_to mylists_path
    else
      render :index
    end
  end

  private
  
  def mylists_params
    params.require(:mylist).permit(:title, :start_time, :text, :user, :image).merge(user_id: current_user.id)
  end
end

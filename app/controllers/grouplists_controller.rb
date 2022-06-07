class GrouplistsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @grouplist = Grouplist.new
    @room = @grouplist.room_id
    @grouplists = Grouplist.where(room_id: @room_id).order(start_time: 'asc')
  end

end

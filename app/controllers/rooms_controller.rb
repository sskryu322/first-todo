class RoomsController < ApplicationController
  def index
    @room = Room.new
  end
end

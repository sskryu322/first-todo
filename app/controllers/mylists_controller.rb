class MylistsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :edit, :destroy]
  def index
    
  end
end

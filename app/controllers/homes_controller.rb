class HomesController < ApplicationController
  def index
    if user_signed_in?
      redirect_to mylists_path
    end
  end
end

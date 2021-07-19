class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to trainings_path(@trainings)
    end
  end
end

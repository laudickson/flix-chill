class WelcomesController < ApplicationController; layout false
  def index
    if current_user
      redirect_to profiles_path
    end
  end
end

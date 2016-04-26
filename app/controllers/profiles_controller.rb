class ProfilesController < ApplicationController
  def index
    @list_of_watchedtvshows = Watchedshow.where(user: current_user)
    @show = Tvshow.new
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
    @list_of_watchedtvshows = Watchedshow.where(user: @user)
  end
end

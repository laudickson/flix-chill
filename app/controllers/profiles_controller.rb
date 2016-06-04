class ProfilesController < ApplicationController
  def index
    @list_of_watchedtvshows = Watchedshow.where(user: current_user)
    @show = Tvshow.new
    @rating = Watchedshow::RATING
    @add_watched_show = Watchedshow.new
    gon.tvshows = Tvshow.pluck(:name)
    gon.posters = Tvshow.all.map{|show| show.posterlink}
  end

  def show
    @user = User.find(params[:id])
    @next_user = User.all.sample
    @list_of_watchedtvshows = Watchedshow.where(user: @user)
  end
end

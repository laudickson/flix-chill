class WatchedshowsController < ApplicationController

  def create
    @user = current_user
    @show = Tvshow.where(name: watchedtvshow_params[:tvshow]).first
    @rating = Watchedshow::RATING
    @add_watched_show = Watchedshow.new(user: @user, tvshow: @show, rating: watchedtvshow_params[:rating] )

    if @add_watched_show.save
      flash[:notice] = "#{@show.name} is now in your watched list!"
      redirect_to profiles_path
    else
      if @show.empty?
        flash[:error] = "This show doesn't exist :("
        redirect_to new_watchedshow_path
      else
        flash[:error] = "This show has already been added to your watched list!"
        redirect_to new_watchedshow_path
      end
    end
  end

  def new
    @add_watched_show = Watchedshow.new
    @rating = Watchedshow::RATING
  end

  private
  def watchedtvshow_params
    params.require(:watchedshow).permit(:rating, :tvshow)
  end
end

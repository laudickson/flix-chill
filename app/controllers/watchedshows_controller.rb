class WatchedshowsController < ApplicationController

  def create
    @user = current_user
    @show = Tvshow.where(name: watchedtvshow_params[:tvshow]).first
    @rating = Watchedshow::RATING

    if @show == nil
      apititle = watchedtvshow_params[:tvshow].gsub(/ /,'-')
      response = HTTParty.get("http://www.omdbapi.com/?t=#{apititle}&type=series&y=&plot=short&r=json")

      if response['Response'] == "True"
        if response['Poster'] != "N/A"
          @show = Tvshow.new(name: response['Title'].titleize, posterlink: response['Poster'], imdblink: "http://www.imdb.com/title/#{response['imdbID']}")
          @show.save
          @add_watched_show = Watchedshow.new(user: @user, tvshow: @show, rating: watchedtvshow_params[:rating])
        else
          @show = Tvshow.new(name: response['Title'].titleize, posterlink: "http://mobile-img.realtyidx.com/sorry.jpg", imdblink: "http://www.imdb.com/title/#{response['imdbID']}")
          @show.save
          @add_watched_show = Watchedshow.new(user: @user, tvshow: @show, rating: watchedtvshow_params[:rating])
        end
      else
        flash[:notice] = "I'm unable to find this show :( Maybe check if you typed the name correctly?"
        redirect_to profiles_path
        return
      end
    else
      @add_watched_show = Watchedshow.new(user: @user, tvshow: @show, rating: watchedtvshow_params[:rating] )
    end
    binding.pry
    if @add_watched_show.save
      flash[:notice] = "#{@show.name} is now in your watched list!"
      redirect_to profiles_path
    else
      flash[:error] = "This show has already been added to your watched list!"
      redirect_to profiles_path
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

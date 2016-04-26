class TvshowsController < ApplicationController
  def new
    @show = Tvshow.new
  end

  def create
    @show = Tvshow.new(tvshow_params)
    apititle = @show.name.gsub(/ /,'-')

    response = HTTParty.get("http://www.omdbapi.com/?t=#{apititle}&type=series&y=&plot=short&r=json")

    if response['response']
      if response['Poster'] != "N/A"
        @show.posterlink = response['Poster']
        @show.imdblink = "http://www.imdb.com/title/#{response['imdbID']}"
      else
        @show.posterlink = "http://mobile-img.realtyidx.com/sorry.jpg"
        @show.imdblink = "http://www.imdb.com/title/#{response['imdbID']}"
      end
    else
      flash[:notice] = "This show doesn't exist :( Maybe check if you typed the name correctly?"
    end

    if @show.save
      flash[:notice] = 'You have successfully added a show!'
      redirect_to profiles_path
    else
      flash[:notice] = @show.errors.full_messages.join('. ')
      redirect_to profiles_path
    end
  end

  private
  def tvshow_params
    params.require(:tvshow).permit(:name)
  end
end

class FriendshipsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @next_user = User.all.sample
  end

  def create
    @friendship = current_user.friendships.build(match_id: params[:match_id], approved: "false")
    if @friendship.save
      flash[:notice] = "Good vibes sent!"
      redirect_to root_path
    else
      flash[:error] = "Unable to send request :("
      redirect_to root_path
    end
  end

  def update
    @friendship = Friendship.where(match_id: current_user, user_id: params[:id]).first
    @friendship.update(approved: true)
    if @friendship.save
      flash[:notice] = 'You two are now connected!'
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong :( try again, please!'
      redirect_to root_path
    end
  end

  def destroy
    @friendship = Friendship.where(match_id: [current_user, params[:id]]).where(user_id: [current_user, params[:id]]).last
    @friendship.destroy
    flash[:notice] = "Removed friendship"
    redirect_to root_path
  end

end

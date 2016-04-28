class FriendshipsController < ApplicationController

  def create
    @user = current_user
    @match = User.find(params[:id])
    @newconnection = Friendship.new(giver_id: @user.id, reciever_id: @match.id)
    @otherconnection = Friendship.new(giver_id: @match.id, reciever_id: @user.id)

    if @newconnection.save && @otherconnection.save
      flash[:notice] = "ya'll can start chillin now"
      redirect_to matches_path
    else
      flash[:error] = "can't chill :("
    end
  end


  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed Friendship"
    redirect_to profiles_path
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end

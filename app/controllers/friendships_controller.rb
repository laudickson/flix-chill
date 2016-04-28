class FriendshipsController < ApplicationController

  def create
    @user = current_user
    @match = User.find(params[:id])
    @newconnection = Friendship.new(giver_id: @user.id, reciever_id: @match.id) Friendship.between(params[:giver_id],params[:reciever_id]).first
    else
      @friendship = Friendship.create!(friendship_params)
    end
    redirect_to profiles_path
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

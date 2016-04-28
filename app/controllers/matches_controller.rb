class MatchesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @matches = User.where.not("id = ?",current_user.id).order("created_at DESC").friends
    @conversations = Conversation.involving(current_user).order("created_at DESC")
  end
end

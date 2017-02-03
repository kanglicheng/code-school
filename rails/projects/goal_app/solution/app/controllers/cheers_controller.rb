class CheersController < ApplicationController
  before_action :require_current_user!

  def create
    @cheer = Cheer.new(giver_id: current_user.id, goal_id: params[:goal_id])

    if current_user.cheer_count <= 0
      flash[:errors] = ["You have cheered quite enough!"]
    elsif @cheer.save
      current_user.decrement_cheer_count!
      goal_owner_name = Goal.find(params[:goal_id]).author.username
      flash[:notices] = ["You cheered #{goal_owner_name}'s goal!"]
    else
      flash[:errors] = @cheer.errors.full_messages
    end

    redirect_back(fallback_location: root_path)
  end

  def index
    @cheers = current_user.cheers_received
  end
end

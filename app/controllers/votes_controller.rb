class VotesController < ApplicationController
  def index
    @votes = Vote.all.order('created_at DESC')
  end
  
  def new
    @vote = Vote.new
  end
  
  def create
    current_user.votes.create(vote_params)
    redirect_to root_path
  end
  
  private
  def vote_params
    params.require(:vote).permit(:title)
  end
end

class VotesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:add_vote]
  def index
    if !cookies[:voted] || cookies[:voted].length == 0
      cookies[:voted] = [].to_json
    end
    @votes = Vote.all.order('created_at DESC')
  end
  
  def new
    @vote = current_user.votes.new
  end
  
  def create
    current_user.votes.create(vote_params)
    redirect_to root_path
  end
  
  def add_vote
    vote = Vote.find(params[:id])
    liked_posts = JSON.parse(cookies[:voted])
    liked_posts.push(vote.id)
    cookies[:voted] = liked_posts.to_json
    increment_count = JSON.parse(vote.vote_count)
    increment_count[params[:options]] += 1
    vote.update_columns(
      vote_count: increment_count.to_json
    )
    cookies.signed[:name] = "Dmitri"
    redirect_to root_path
  end
  
  private
  def vote_params
    params.require(:vote).permit(:title,:options)
  end
end

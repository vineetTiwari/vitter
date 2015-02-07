class VotesController < ApplicationController
before_action :authenticate_user!

def create
    @tweet      = Tweet.find params[:tweet_id]
    @vote       = @tweet.votes.new(vote_params)
    @vote.user  = current_user
    if @vote.save
      redirect_to root_path, notice: "Thanks for voting"
    else
      redirect_to root_path, alert: "Your vote wasn't recorded!"
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:is_up)
  end

end

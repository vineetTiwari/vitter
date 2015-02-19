class TweetsController < ApplicationController
before_action :find_own_tweet, only: [:edit, :destroy]

  def index
    @tweet   =   Tweet.new
    @comment =   Comment.new
    @vote    =   Vote.new
    # @comments =  @tweet.comments #.ordered_by_creation
    # @tweets  =   Tweet.paginate(:page => params[:page])
    @tweets  =   Tweet.order(created_at: :desc).paginate(:page => params[:page])

  end

  def create
    @tweet      =  Tweet.new tweet_params
    @tweet.user =  current_user
    @tweet.save
    redirect_to root_path, notice: "Tweet Created Successfully!"
  end

  def destroy
    @tweet.destroy
    redirect_to root_path, notice: "Tweet Deleted Successfully!"
  end
  
  private 

  def find_own_tweet
    @tweet = current_user.tweets.find params[:id]
  end

  def tweet_params
    params.require(:tweet).permit(:body)
  end

end

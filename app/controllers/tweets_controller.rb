class TweetsController < ApplicationController

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
    @tweet = Tweet.find params[:id]
    @tweet.destroy
    redirect_to root_path, notice: "Tweet Deleted Successfully!"
  end
  
  private 

  def tweet_params
    params.require(:tweet).permit(:body)
  end

end

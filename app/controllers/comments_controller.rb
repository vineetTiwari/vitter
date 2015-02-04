class CommentsController < ApplicationController
  
  def create
    @tweet = Tweet.find params[:tweet_id]
    @comment = Comment.new comment_params
    @comment.tweet = @tweet
    @comment.save 
    redirect_to tweets_path, notice: "Comment Created Successfully!"
  end

  def destroy
    @tweet = Tweet.find params[:tweet_id]
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to tweets_path, notice: "Comment Deleted Successfully!"
  end

  private
  
    def comment_params
      params.require(:comment).permit(:body)
    end

end

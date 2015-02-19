class CommentsController < ApplicationController
before_action :find_own_comment, only: [:edit, :destroy]

  def create
    @tweet         =  Tweet.find params[:tweet_id]
    @comment       =  Comment.new comment_params
    @comment.tweet =  @tweet
    @comment.user  =  current_user
    @comment.save 
    @comments      =  Comment.order(created_at: :desc)
    redirect_to tweets_path, notice: "Comment Created Successfully!"
  end

  def destroy
    @tweet   =  Tweet.find params[:tweet_id]
    @comment.destroy
    redirect_to tweets_path, notice: "Comment Deleted Successfully!"
  end

  private

    def find_own_comment
      @comment = current_user.comments.find params[:id]
    end
  
    def comment_params
      params.require(:comment).permit(:body)
    end

end

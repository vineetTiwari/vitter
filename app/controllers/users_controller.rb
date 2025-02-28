class UsersController < ApplicationController
  skip_before_action :authenticate_user! 

  def new
    @user = User.new
  end

  def create
    @user                =  User.new user_params
    if @user.save
       session[:user_id] =  @user.id
       redirect_to root_path, notice: "Thank you for signign up!"
    else 
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name)
  end

end
class FollowsController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def create
    @user = User.find(params[:user_id])
    if current_user.follow(@user)
      flash[:success] = "User followed"
    else 
      flash[:danger] = "Unable to follow user"
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    current_user.stop_following(@user)
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:following, :followers, :show]
  before_action :correct_user, only: [:update, :connections]

  def index
    @users = User.all
  end

  def show; end

  def connections; end

  def dashboard
    @user = User.find(params[:user_id])
    @last_sign_in = @user.last_sign_in_at
    @sign_in_count = @user.sign_in_count
    @created_at = @user.created_at
    @following = @user.follow_count
    @followers = @user.followers_count
  end

  def following
    @following = @user.all_following #.paginate(page: params[:page])
  end

  def followers
    @followers = @user.followers #.paginate(page: params[:page])
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your profile has been updated successfully."
      redirect_to user_dashboard_path(current_user)
    else 
      render 'connections'
    end
  end

  private
  
  def correct_user
    @user = current_user
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:city, :state, :country, :bio, :github, :linkedin, :twitter, :website, :avaliable)
  end
end
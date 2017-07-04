class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:following, :followers, :show]
  before_action :correct_user, only: [:update, :connections]

  def index
    @users = User.all
  end

  def show; end

  def connections
    # Creates a skill first 
    # time but updates other times
    @skill = current_user.build_skill unless current_user.skill
  end

  def dashboard
    @user = User.find(params[:user_id])
    @following = @user.follow_count
    @followers = @user.followers_count
      if @user.skill.nil?
        @user_skill = 'No skill set'
      else
        @user_skill = @user.skill.name
      end
  end

  def following
    @count = @user.follow_count
    @following = Kaminari.paginate_array(@user.all_following).page(params[:page]).per(52)
  end

  def followers
    @count = @user.followers_count
    @followers = Kaminari.paginate_array(@user.followers).page(params[:page]).per(52)
  end

  def update
    if @user.update_attributes(user_params)
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
    params.require(:user).permit(
      :city, 
      :state, 
      :country, 
      :bio, 
      :github, 
      :linkedin, 
      :twitter, 
      :website, 
      :avaliable, 
      skill_attributes: [:id, :name]
    )
  end
end
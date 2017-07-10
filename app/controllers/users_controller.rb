class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:following, :followers, :show]
  before_action :correct_user, only: [:update, :connections]
  
  def show; end

  def connections
  end
  
  def account_log
  end

  def show
    @user = User.find(params[:id])
    @following = @user.follow_count
    @followers = @user.followers_count
      if @user.skill.nil?
        @user_skill = 'No skill set'
      else
        @user_skill = @user.skill
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
      redirect_to current_user
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
      :skill
    )
  end
end
class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:update, :dashboard]

  def connections; end

  def dashboard
    @last_sign_in = @user.last_sign_in_at
    @sign_in_count = @user.sign_in_count
    @created_at = @user.created_at
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your profile has been updated successfully."
      redirect_to users_dashboard_path
    else
      render 'connections'
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:city, :state, :country, :bio, :github, :linkedin, :twitter, :website, :avaliable)
  end
end

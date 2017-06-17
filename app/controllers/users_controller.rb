class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:update, :account_log]

  def connections; end

  # def account_log
  #   @last_sign_in = @user.last_sign_in_at
  #   @sign_in_count = @user.sign_in_count
  # end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account has been updated successfully."
      redirect_to root_path
    else
      render 'connections'
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:city, :state, :country, :bio, :github, :linkedin, :twitter, :website)
  end
end

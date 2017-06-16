class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:update]

  def connections; end

  def update
    if @user.update(user_params)
      flash[:success] = "Yay"
      redirect_to root_path
    else
      render 'connections'
    end
  end

  private

  def set_user
    @user = current_user.id
  end

  def user_params
    params.require(:user).permit(:city, :state, :country, :bio)
  end
end

class Admin::UsersController < Admin::BaseController
  def index
    @users = User.order(:first_name).page(params[:page]).per(30)
    @count = User.all.count
  end
  
  def show
    @user  = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy && !@user.admin?
      flash[:success] = "Successfully deleted user"
      redirect_to admin_users_path
    else 
      flash[:warning] = "Unable to delete the current user. User may be an admin of the site."
    end
  end
end
class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :authenticate_admin!

  def authenticate_admin!
    redirect_to root_url unless current_user.admin? 
    flash.notice = "You're not authorized to view that page"
  end
end
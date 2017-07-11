class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def authenticate_admin!
    render_404 unless current_user.try(:admin?) && current_user
    flash.notice = "You're not authorized to view that page"
  end
end
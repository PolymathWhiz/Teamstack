class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  
  # Renders 404 if user is
  # not logged in and isn't
  # an admin
  def authenticate_admin!
    render_404 unless current_user.try(:admin?) && current_user
  end
end
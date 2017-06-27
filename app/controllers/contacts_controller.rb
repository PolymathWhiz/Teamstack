class ContactsController < ApplicationController
  before_action :prevent_route

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "Thank you for contacting us!"
      redirect_back fallback_location: contact_path
    else
      render 'new'
    end
  end

  private

    # Prevents accessing this controller when the user is logged in
    def prevent_route
      redirect_to user_dashboard_path(current_user) unless current_user.nil?
    end

    def contact_params
      params.require(:contact).permit(:name, :email, :subject, :message)
    end
end

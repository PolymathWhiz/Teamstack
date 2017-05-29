class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:success] = "Thank you for contacting us"
      redirect_back fallback_location: contact_path
    else
      render 'new'
    end
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :subject, :message)
    end
end

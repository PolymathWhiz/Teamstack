class Admin::ContactsController < Admin::BaseController
  before_action :prevent_route
  
  def index
    @contacts = Contact.order(:created_at).page(params[:page]).per(30)
    @count = Contact.all.count
  end

  def destroy
    @contact = Contact.find(params[:id])
    if @contact.destroy
      flash[:success] = "Contact message successfully deleted"
      redirect_back fallback_location: admin_contact_path
    end
  end
end

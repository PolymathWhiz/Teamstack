class Admin::ContactsController < Admin::BaseController  
  def index
    @contacts = Contact.order(:created_at).page(params[:page]).per(30)
    @count = Contact.all.count
  end

  def destroy
    @contact = Contact.find(params[:id])
    if @contact.destroy
      flash[:success] = "Message successfully deleted"
      redirect_back fallback_location: admin_contact_path
    else 
      flash[:danger] = "Message could not be deleted"
    end
  end
end
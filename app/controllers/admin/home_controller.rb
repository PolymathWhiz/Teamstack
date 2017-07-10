class Admin::HomeController < Admin::BaseController
  def index
    @user_count = User.all.count
    @total_feedback = Feedback.all.count
    @total_contact_messages = Contact.all.count
    @total_admins = User.where(admin: true).count
  end
end 
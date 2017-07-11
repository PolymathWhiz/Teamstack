class Admin::HomeController < Admin::BaseController
  # Used in the index count to
  def index
    @user_count = User.all.count
    @total_feedback = Feedback.all.count
    @total_contact_messages = Contact.all.count
    @total_admins = User.where(admin: true).count
  end
end 
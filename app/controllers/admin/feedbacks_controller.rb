class Admin::FeedbacksController < Admin::BaseController
  def index
    @users = Feedback.order(:created_at).page(params[:page]).per(30)
    @count = Feedback.all.count
  end
  
  def destroy
    @feedback = Feedback.find(params[:id])
    if @feedback.destroy
      flash[:success] = "Successfully deleted user"
      redirect_to admin_feedback_path
    else
      flash[:warning] = "Unable to delete the current feedback"
    end
  end
end
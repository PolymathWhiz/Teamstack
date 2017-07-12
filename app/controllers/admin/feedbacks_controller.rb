class Admin::FeedbacksController < Admin::BaseController
  def bug_notice
    @bugs = Feedback.where("category = ?", 'Bug Report').order(:created_at).page(params[:page]).per(30)
    @count = @bugs.count
  end
  
  def feature_requests
    @feature_requests = Feedback.where("category = ?", 'Feature Request').order(:created_at).page(params[:page]).per(30)
    @count = @feature_requests.count
  end
  
  def general_complaints
    @general_complaints = Feedback.where("category = ?", 'General Complaints').order(:created_at).page(params[:page]).per(30)
    @count = @general_complaints.count
  end
  
  def other
    @other = Feedback.where("category = ?", 'Other').order(:created_at).page(params[:page]).per(30)
    @count = @other.count
  end
  
  def help
    @help = Feedback.where("category = ?", 'Help').order(:created_at).page(params[:page]).per(30)
    @count = @help.count
  end
  
  def destroy
    @feedback = Feedback.find(params[:id])
    if @feedback.destroy
      flash[:success] = "Successfully deleted feedback"
      redirect_to admin_root_path
    else
      flash[:warning] = "Couldn't delete the feedback"
    end
  end
end
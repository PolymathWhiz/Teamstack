class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new
    @feedback = current_user.feedbacks.build
  end

  def create
    @feedback = current_user.feedbacks.create(feedback_params)
    if @feedback.save
      flash[:success] = "Thanks for your feedback."
      redirect_back fallback_location: feedback_path
    else
      render 'new'
    end
  end

  private

    def feedback_params
      params.require(:feedback).permit(:category, :description)
    end
end

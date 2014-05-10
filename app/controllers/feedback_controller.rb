class FeedbackController < ApplicationController

  def new
    @feedback = Feedback.new
  end


  def create
    @feedback = Feedback.new(params[:feedback])
    respond_to do |format|
      if @feedback.save
        format.html { redirect_to root_path, notice: 'Thanks for your feedback!'}
      else
        format.html { render action: "new" }
      end
    end
  end

end
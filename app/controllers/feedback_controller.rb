class FeedbackController < ApplicationController


  def new
    
  end


  def create
    @feedback = Feedback.new(params[:feedback])
    if @feedback.save
      format.html { redirect_to @question, notice: 'Thanks for your feedback!'}
    else
      format.html { render action: "new" }
    end
  end

end
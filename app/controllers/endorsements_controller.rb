class EndorsementsController < ApplicationController

def create
	@user = User.find(params[:user_id])
	@endorsement = Endorsement.new(params[:endorsement])
	@endorsement.user_id = @user.id
	@endorsement.author = current_user
	
	respond_to do |format|
		if @endorsement.save
	    @user.update_endorsements
	    format.html { redirect_to @user, notice: 'Rating was successfully created.' }
	  else
	    format.html { redirect_to @user, alert: 'We couldn\'t save that, sorry!' }
	    format.json { render json: @user.errors, status: :unprocessable_entity }
	  end
	end
end


end
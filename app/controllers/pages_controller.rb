class PagesController < ApplicationController


  def example1



	  def create
	    params[:response].each do |answer|
	      current_user.responses.create :answer_id => answer[:answer_id], :user_id => current_user.id
	  end

	    if current_user.save
	      flash[:info] = "Your survey has been submitted successfully!"

	    else
	      flash.now[:error] = "There were problems with your survey submission."
	      render :edit
	    end
	  end

	  @test = Test.find(15)

	  @user = User.find(2)

	  @response = Response.all
  end
end

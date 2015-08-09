class PagesController < ApplicationController


  def example1



	  def create
	    params[:response].each do |question, answer|
	      current_user.responses.create :question_id => question, :answer_id => answer[:answer_id], :content => answer[:content],
	        :user_id => current_user.id
	    end

	    if current_user.save
	      flash[:info] = "Your survey has been submitted successfully!"
	      redirect_to test_path(Test.find(params[:test_id]))
	    else
	      flash.now[:error] = "There were problems with your survey submission."
	      render :edit
	    end
	    authorize! :create, :test
	  end

	  @test = Test.find(15)

	  @user = User.find(2)

	  @response = Response.all
  end
end

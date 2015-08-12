class TakeTestsController < ApplicationController
  before_action :set_take_test, only: [:show, :edit, :update, :destroy]


  #SPEC: 7.1.1.2: Adding Create action
  def create
    params[:response].each do |answer|
      current_user.responses.create :answer_id => answer[:answer_id], :user_id => current_user.id 
    end

    if current_user.save
      format.html { redirect_to @take_test, notice: 'Take test was successfully created.' }
    else
      flash.now[:error] = "There were problems with your survey submission."
            render :edit
    end
  end

  #SPEC: 7.1.1.3: Adding Edit action
  def edit
    @survey = Survey.find(params[:id]) if params[:id]
    authorize! :show, :survey
  end

  #SPEC: 7.1.1.4: Adding Show action
  def show
    @test = Test.find(15)

    @user = User.find(2)

  
  end

end
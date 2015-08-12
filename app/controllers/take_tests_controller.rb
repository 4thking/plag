class TakeTestsController < ApplicationController
  before_action :set_take_test, only: [:show, :edit, :update, :destroy]

  # GET /take_tests
  # GET /take_tests.json
  def index
  end

  def new
     @test = Test.find(15)

  end

  #SPEC: 7.1.1.2: Adding Create action
  def create
    params[:response].each do |answer|
      current_user.responses.create :answer_id => answer[:answer_id], :user_id => current_user.id 
    end

    if current_user.save
      format.html { redirect_to @take_test, notice: 'Take test was successfully created.' }
    else
        format.html { render :new }
        format.json { render json: @take_test.errors, status: :unprocessable_entity }
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

    @response = Response.all
  end

end
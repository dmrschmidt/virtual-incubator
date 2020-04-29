class QuestionsController < ApplicationController
  load_and_authorize_resource

  # GET /questions/1
  # GET /questions/1.json
  def show
    @answer = Answer.new
  end

  # GET /questions/new
  def new; end

  # POST /questions
  # POST /questions.json
  def create
    @question.user = current_user

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:user_id, :title, :current_challenges, :actions_taken, :skills_needed_csv)
    end
end

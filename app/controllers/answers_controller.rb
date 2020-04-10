class AnswersController < ApplicationController
  before_action :set_question

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @question, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { redirect_to @question, alert: 'Answer creation failed.' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_question
      @question = Question.find(answer_params[:question_id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:text, :question_id)
    end
end

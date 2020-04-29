class AnswersController < ApplicationController
  load_and_authorize_resource

  def create
    @answer.user = current_user

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer.question, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer.question }
      else
        format.html { redirect_to @answer.question, alert: 'Answer creation failed.' }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:text, :question_id)
    end
end

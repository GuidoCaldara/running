class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @question = Question.find(params[:question_id])
    @race = @question.race
    @answer.question = @question
    @answer.user = current_user
    if @answer.save
      redirect_to @race
    else
      render "races/show"
    end
  end

  def answer_params
    params.require(:answer).permit(:text)
  end
end

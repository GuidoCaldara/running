class QuestionsController < ApplicationController
  def create
    @question = Question.new(question_params)
    @race = Race.find(params[:race_id])
    @question.race = @race
    @question.user = current_user
    if @question.save
      redirect_to @race
    else
      render "races/show"
    end
  end

  def question_params
    params.require(:question).permit(:title, :text)
  end


end

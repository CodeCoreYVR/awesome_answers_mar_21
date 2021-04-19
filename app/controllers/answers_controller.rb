class AnswersController < ApplicationController
  def create
    # /questions/:question_id/answers(.:format) 👈🏻 Route for quick reference
    @question=Question.find params[:question_id] # question_id comming from 👆🏻URL
    answer_params= params.require(:answer).permit(:body)
    @answer=Answer.new answer_params
    @answer.question=@question
    @answer.save
    redirect_to question_path(@question), notice: 'Answer created'
  end
end

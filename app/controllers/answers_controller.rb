class AnswersController < ApplicationController
  def create
    # /questions/:question_id/answers(.:format) 👈🏻 Route for quick reference
    @question=Question.find params[:question_id] # question_id comming from 👆🏻URL
    answer_params= params.require(:answer).permit(:body)
    @answer=Answer.new answer_params
    @answer.question=@question
    if @answer.save
      redirect_to question_path(@question), notice: 'Answer created'
    else 
      @answers=@question.answers.order(created_at: :desc)
      render '/questions/show'
    end
  end
end

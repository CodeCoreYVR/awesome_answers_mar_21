# Make sure to inherit from the Api::ApplicationController instead of
# ApplicationController
class Api::V1::QuestionsController < Api::ApplicationController
  before_action :find_question, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [ :create, :destroy ]

  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  def index
    questions = Question.order(created_at: :desc)

    render(
      json: questions,
      # To stop us from overfetching extra data from the 
      # QuestionSerializer, we can use a custom serializer.
      each_serializer: QuestionCollectionSerializer,
    )
  end

  def show
    if @question
    render(
      json: @question,
      # We need to include the author for the nested user
      # assocation for answers (which is named author)
      # because nested associations are not serialized by default
      include: [ :author, { answers: [ :author ] } ]
    )
    else
      render(json: {error: "Question Not Found" })
    end
  end

  def create
    question = Question.new question_params
    question.user = current_user

    # if question.save
    #   render json: { id: question.id }
    # else
    #   render(
    #     json: { errors: question.errors.messages },
    #     status: 422 # Unprocessable Entity
    #   )
    # end

    question.save!
    render json: {id: question.id }
  end

  def update
    if @question.update question_params
      render json: { id: @question.id }
    else
      render(
        json: { errors: @question.errors.messages },
        status: 422
      )
    end
  end

  def destroy
    @question.destroy
    head :ok
  end

  private 

  def find_question
    @question = Question.find params[:id]
  end

  def question_params
    params.require(:question).permit(:title, :body, :tag_names)
  end

  def record_invalid(error)
    invalid_record = error.record
    errors = invalid_record.errors.map do |field, message|
      {
        type: error.class.to_s,
        record_type: invalid_record.class.to_s,
        field: field,
        message: message,
      }
    end
    render(
      json: { status:422, errors: errors }
    )
  end

end

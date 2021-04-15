class QuestionsController < ApplicationController
    def index
       @questions = Question.all #Model.all is a method built into active record used to return all records of that model 
    end

    def new
        #because Rails form helper methods need an instance of a model to work, we create a new instance
        @new_question = Question.new
    end

    def create
        @question = Question.new params.require(:question).permit(:title, :body)

        if @question.save
            flash[:notice] = "Question created successfully"
            redirect_to questions_index_path
        else
            render :new
        end
    end

    def show
        @question = Question.find params[:id]
    end

    def edit
        @question = Question.find params[:id]
    end

    def update
        @question = Question.find params[:id]
        if @question.update params.require(:question).permit(:title, :body)
            redirect_to question_path(@question)
        else
            render :edit
        end
    end

    def destroy
        @question = Question.find params[:id]
        @question.destroy
        redirect_to questions_index_path
    end

end

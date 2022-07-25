class QuestionsController < ApplicationController
    def index
        @question = Question.all
        #@answers = Answer.where(question_id: @question.id).pluck(:id)
    end

    def show
        @question = Question.find_by(id: params[:id])
    end

    def new
      @question = Question.new()
    end

    def create
      @question = Question.new(question_params)
      if @question.save
        redirect_to question_path(@question.id)
      else
        render "new", status: :unprocessable_entity
      end
    end

    def edit
      @question = Question.find_by(id: params[:id])
    end

    def update
      @question = Question.find_by(id: params[:id])
      if @question.update(question_params)
        redirect_to @question
      else
        render "edit", status: :unprocessable_entity
      end
    end

    def destroy
      @question = Question.find_by(id: params[:id])
      if @question.destroy
        redirect_to root_path
      else
        redirect_to @question
      end
    end

    private
    
    def question_params
      question = params.require(:question).permit(:title, :content)
      user = { "user_id" => current_user.id, "name" => current_user.name }
      return question.merge(user)
    end
end

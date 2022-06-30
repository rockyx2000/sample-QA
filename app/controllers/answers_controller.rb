class AnswersController < ApplicationController

    def create
      @question = Question.find_by(id: params[:question_id])
      @question.answers.create(answer_params)
      redirect_to question_path(@question)
    end

    def destroy
      @question = Question.find_by(id: params[:question_id])
      @answer = @question.answers.find_by(id: params[:id])
      @answer.destroy
      redirect_to @question, status: :see_other
    end

    def show
      @answer = Answer.find_by(question: params[:question_id])
    end

    private

    def answer_params
      params.require(:answer).permit(:name, :content)
    end
end

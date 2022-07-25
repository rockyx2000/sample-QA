class AnswersController < ApplicationController

    def create
      @question = Question.find_by(id: params[:question_id])
      if @question.answers.create(answer_params)
        redirect_to question_path(@question)
      else
        render "show", status: :unprocessable_entity
      end
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
      answer = params.require(:answer).permit(:content)
      user = { "name" => current_user.name, "user_id" => current_user.id }
      return answer.merge(user)
    end
end

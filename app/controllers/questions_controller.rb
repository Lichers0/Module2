class QuestionsController < ApplicationController
  rescue_from 'ActiveRecord::RecordNotFound', with: :question_not_found

  before_action :find_test, only: [:index, :show, :create]
  before_action :find_question, only: [:destroy, :show]

  def index
    render json: @test.questions
  end

  def show
    render json: @question
  end

  def new; end

  def create
    @test.questions.create!(question_params)
    render plain: "Created", status: 202
  end

  def destroy
    @question.destroy
    render plain: "Deleted", status: 202
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_not_found
    render plain: "Question not found", status: 404
  end

end

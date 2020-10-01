class QuestionsController < ApplicationController
  rescue_from 'ActiveRecord::RecordNotFound', with: :question_not_found

  before_action :find_test, only: [:index, :show, :create]

  def index
    render json: @test.questions
  end

  def show
    render json: @test.questions.find(params[:id])
  end

  def new
  end


  def create
    question = Question.create(question_params)
    @test.questions << question
    @test.question
    @test.save
    render plain: "Created", status: 202
  end

  def delete
    question = Question.find(params[:id])
    question.destroy
    render plain: "Deleted", status: 202
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_not_found
    render plain: "Question not found", status: 404
  end

end

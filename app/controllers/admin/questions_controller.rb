class Admin::QuestionsController < Admin::BaseController
  rescue_from 'ActiveRecord::RecordNotFound', with: :question_not_found

  before_action :find_test, only: [:index, :create, :new]
  before_action :find_question, only: [:destroy, :show, :update, :edit]

  def index; end

  def show; end

  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to [:admin, @question]
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to [:admin, @question]
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to [:admin, @question.test]
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

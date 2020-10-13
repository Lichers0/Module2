class Admin::AnswersController < Admin::BaseController
  before_action :find_answer, only: %i[show edit update destroy]
  before_action :find_question, only: %i[new create]

  def show; end

  def new
    @answer = @question.answers.new
  end

  def edit; end

  # POST /answers
  # POST /answers.json
  def create
    @answer = @question.answer.build(answer_params)
    if @answer.save
      redirect_to [:admin, @question], notice: 'Answer was successfully created.'
    else
      render :new
    end
  end

  def update
    if @answer.update(answer_params)
      redirect_to [:admin, @answer.question], notice: 'Answer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to [:admin, @answer.question], notice: 'Answer was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def find_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:body, :correct)
    end

    def find_question
      @question = Question.find(params[:question_id])
    end
end

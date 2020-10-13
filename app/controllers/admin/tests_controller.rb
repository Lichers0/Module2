class Admin::TestsController < Admin::ApplicationController

  before_action :find_test, only: %i[show update edit destroy start]

  def index
    @tests = Test.all
  end

  def show; end

  def new
    @test = current_user.tests_authors.build
  end

  def create
    @test = current_user.tests_authors.build(test_params)
    if @test.save
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to [:admin, @test], notice: t('.success')
    else
      render :edit
    end
  end

  def edit; end

  def destroy
    @test.destroy
    redirect_to test_path
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level)
  end
end

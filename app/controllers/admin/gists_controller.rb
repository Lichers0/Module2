class Admin::GistsController < Admin::BaseController
  def index
    @gist = Gist.includes(:question, :user)
  end
end

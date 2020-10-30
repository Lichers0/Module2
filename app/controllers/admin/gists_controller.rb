class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.includes(:question, :user)
  end
end

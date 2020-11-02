class GistCreatorService
  def initialize(user, question, flash)
    @question = question
    @user = user
    @flash = flash
  end

  def create
    service = GistQuestionService.new(@question)
    result = service.call

    link = result.html_url
    Gist.create(user: @user,
                question: @question,
                url: link)
    @flash[:notice] = I18n.t("test_passages.gist.success", url: link)
  rescue StandardError => e
    @flash[:notice] = I18n.t("test_passages.gist.failure", error: e.message)
  end
end

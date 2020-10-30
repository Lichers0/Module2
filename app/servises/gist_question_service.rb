class GistQuestionService
  def initialize (question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @result = @client.create_gist(gist_params)
  end

  def make_gist(service)
    git_response = service.call

    current_user.gists.create(question: @test_passage.current_question,
                              url: git_response.html_url)
    flash[:gist_create] = git_response.html_url
  rescue StandardError => e
    flash[:alert] = "#{t('.failure')}. #{t('.error_reason')}: #{e.response_status}"
  end

  private

  def gist_params
    {
      description: I18n.t(".gist_question", title: @test.title),
      files: {
        'test-furu-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def default_client
    GitHubClient.new
  end

  def gist_content
    [@question.body, @question.answers.pluck(:body)].flatten.join("\n")
  end
end
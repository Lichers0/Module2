class GistQuestionService
  def initialize (question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    @result = @client.create_gist(gist_params)
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
module QuestionsHelper
  def question_header(question)
    header = question.new_record? ? t("common.new") : t("common.edit")
    "#{header} #{question.test.title} #{t("common.question")}"
  end
end

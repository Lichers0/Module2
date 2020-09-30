class Answer < ApplicationRecord
  MAX_COUNT_ANSWER = 4
  belongs_to :question

  validates :body, presence: true
  validates :correct_count_answer_by_question, if: :question, on: :create

  scope :right_only, -> { where(correct: true) }

  private

  def correct_count_answer_by_question
    if question.answers.count >= MAX_COUNT_ANSWER
      error.messages[:answer] << "Question must have 4 answers MAX"
    end
  end
end

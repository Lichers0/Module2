class TestPassage < ApplicationRecord
  SUCCESS_TEST_LEVEL = 85.freeze

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question


  def completed?
    self.current_question.nil? || time_is_over?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def current_test_level
    (correct_questions.to_f / test.questions.count * 100).to_i
  end

  def passed?
    current_test_level >= SUCCESS_TEST_LEVEL
  end

  def index_current_question
    # test.questions.index(current_question) + 1
    test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  def total_test_questions
    test.questions.count
  end

  def timer_seconds
    (expires_time - Time.current).to_i
  end

  private

  def time_is_over?
    expires_time < Time.current
  end

  def before_validation_set_first_question
    self.current_question = new_record? ? test.questions.first : next_question
  end

  def correct_answer?(answer_ids)
    correct_answers&.ids.sort == answer_ids&.map(&:to_i)&.sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def expires_time
    created_at + test.timerleft.minutes
  end

end

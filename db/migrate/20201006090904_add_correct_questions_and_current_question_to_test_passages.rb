class AddCorrectQuestionsAndCurrentQuestionToTestPassages < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :correct_questions, :integer
    add_reference :test_passages, :current_question, foreign_key: { to_table: :questions }, null: false
  end
end

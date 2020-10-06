class ChangeResultsToTestPassages < ActiveRecord::Migration[6.0]
  def change
    rename_table :results, :test_passages
  end
end

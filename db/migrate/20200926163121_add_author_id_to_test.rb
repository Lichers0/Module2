class AddAuthorIdToTest < ActiveRecord::Migration[6.0]
  def change
    # add_column :tests, :author_id, :integer, foreign_key: true
    # add_foreign_key :tests, :users, column: :author_id
    add_reference :tests, :author, type: :integer, foreign_key: {to_table: :users}
  end
end

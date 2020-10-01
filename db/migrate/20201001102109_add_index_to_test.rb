class AddIndexToTest < ActiveRecord::Migration[6.0]
  add_index :tests, [:title, :level], unique: true
end

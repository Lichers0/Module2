class AddIndexToTest < ActiveRecord::Migration[6.0]
  add_index :users, [:title, :level], unique: true
end

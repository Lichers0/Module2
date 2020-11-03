class AddTimerleftToTest < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :timerleft, :integer
  end
end

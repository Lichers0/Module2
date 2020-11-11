class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :picture
      t.integer :type_rule, default: 0
      t.string :rule_param

      t.timestamps
    end
  end
end

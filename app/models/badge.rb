class Badge < ApplicationRecord
  enum type_rule: %i[all_tests_category first_try_passed all_tests_level]

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :rule, presence: true
  validate :rule_validate, on: :create

  private

  #all_tests_category first_try_passed all_tests_level

  def rule_validate
    send("valid_#{type_rule}!")
  rescue
    errors.add(:type_rule, t(".incorrect_rule"))
  end

  def valid_all_tests_category!
    errors.add(:rule_param, t(".category_not_found")) unless Category.find(rule_param)
  end

  def valid_first_try_passed!
    errors.add(:rule, t(".test_name_not_found")) unless Test.find_by(name: rule_param)
  end


end

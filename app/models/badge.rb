class Badge < ApplicationRecord
  enum type_rule: %i[all_tests_category first_try_passed all_tests_level]

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :title, :type_rule, presence: true
  validate :rule_validate, on: :create

  private

  #all_tests_category first_try_passed all_tests_level

  def rule_validate
    send("valid_#{type_rule}!")
  rescue StandardError => e
    errors.add(:type_rule, I18n.t(".incorrect_rule"))
  end

  def valid_all_tests_category!
    errors.add(:rule_param, I18n.t(".category_not_found")) unless Category.find(rule_param)
  end

  def valid_first_try_passed!
    errors.add(:rule_param, I18n.t(".test_name_not_found")) unless Test.find_by(title: rule_param)
  end

  def valid_all_tests_level!

  end
end

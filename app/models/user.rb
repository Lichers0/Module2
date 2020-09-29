class User < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy
  has_many :tests_authors, class_name: "Test", foreign_key: :author_id, dependent: :destroy

  def linking_tests(level)
    Test.joins(:results).where(level: level)
  end
end

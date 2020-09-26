class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results
  has_many :tests_authors, class_name: "Test", foreign_key: :author_id

  def linking_tests(level)
    Test.joins("INNER JOIN results On tests.id = results.test_id").
        where(results: { user_id: id }, level: level)
  end
end

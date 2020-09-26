class User < ApplicationRecord
  has_many :results
  has_many :tests, through: :results

  def linking_tests(level)
    Test.joins("INNER JOIN results On tests.id = results.test_id").
        where(results: { user_id: id }, level: level)
  end
end

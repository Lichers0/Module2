class User < ApplicationRecord
  def linking_tests(level)
    Test.joins("INNER JOIN results On tests.id = results.test_id").
        where("results.user_id = ?", self.id).and(Test.where(level: level))
  end
end

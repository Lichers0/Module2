class User < ApplicationRecord
  def linking_tests(level)
    # Рабооаем без ассоциаций
    # В замечании к прошлому заданяю меня попросили убрать связи из модели
    id = self.id
    tests_id = UserTestLink.where(user_id: id).pluck(:test_id)
    Test.find(tests_id).and(Test.where(level: level))
  end
end

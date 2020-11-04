class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    return unless @test_passage.passed
    Badge.find_each do |badge|
      @user.add_badge(badge) if send("can_add_#{badge.type_rule}?(badge.rule_param)")
    end
  end

  private

  #all_tests_category first_try_passed all_tests_level

  def can_add_all_tests_category?(category_id)
    category = Category.find(category_id)

    return false if @test_passage.test.category_id != category.id

    uniq_tests_passed = @user.passed_tests_by_category(category).distinct.count
    category.tests.count == uniq_tests_passed
  end

  def can_add_first_try_passed?(test_title)
    if @test_passage.test.title == test_title && @test_passage.passed
      @user.tests.where(title: test_title).count == 1
    end
  end

  def can_add_all_tests_level?(level)
    Test.where(level: level).count == @user.passed_tests_by_level(level).distinct.count
  end
end

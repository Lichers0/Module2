class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = @test_passage.test
  end

  def call
    # return unless @test_passage.passed
    Badge.find_each do |badge|
      # .rule_param
      @user.add_badge(badge) if send("can_add_#{badge.type_rule}?", badge)
    end
  end

  private

  #all_tests_category first_try_passed all_tests_level
  # def can_add_all_tests_category?(category_id)
  def can_add_all_tests_category?(badge)
    category_id = badge.rule_param.to_i

    return false if @test_passage.test.category_id != category_id

    count_current_badge = @user.count_badge(badge)
    Test.where(category_id: category_id).each do |test|
      return false unless @user.count_passed(test) > count_current_badge
    end

    true
  end

  def can_add_first_try_passed?(badge)
    test_title = badge.rule_param

    return false if @test.title != test_title

    @test_passage.passed && @user.tests.where(title: test_title).count == 1
  end

  def can_add_all_tests_level?(badge)
    level = badge.rule_param.to_i

    return false if @test.level != level

    count_current_badge = @user.count_badge(badge)
    Test.where(level: level).each do |test|
      return false unless @user.count_passed(test) > count_current_badge
    end

    true
  end
end

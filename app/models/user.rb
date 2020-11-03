class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :tests_authors, class_name: "Test", foreign_key: :author_id, dependent: :destroy
  has_many :gists, dependent: :destroy
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges, dependent: :destroy

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         # :trackable,
         :validatable,
         :confirmable

  def linking_tests(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    is_a?(Admin)
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def passed_tests
    test_passages.where(passed: true)
  end

  def passed_tests_by_category(category)
    passed_tests.where(category: category)
  end

  def passed_tests_by_level(level)
    passed_tests.where(level: level)
  end

  def add_badge(badge)
    badges << badge
  end
end

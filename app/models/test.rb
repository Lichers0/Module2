class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages, dependent: :destroy
  validates :title, presence: true, uniqueness: { scope: :level}
  validates :level, numericality: { only_integer:  true, greater_than_or_equal_to: 0}

  scope :easy,    -> { where(level: 0..1) }
  scope :middle,  -> { where(level: 2..4) }
  scope :hard,    -> { where(level: 5..Float::INFINITY) }

  scope :list_by_category, ->(category_title) do
    joins(:category).
      where(categories: { title: category_title }).
      order("tests.title DESC")
  end

  def self.list_by_category_name(category_title)
    list_by_category(category_title).
      pluck("tests.title")
  end
end

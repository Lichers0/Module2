class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results, dependent: :destroy

  def self.list_by_category(category_title)
    joins(:category).
      where(categories: { title: category_title }).
      order("tests.title DESC").
      pluck("tests.title")
  end

end

class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :results
  has_many :users, through: :results

  def self.list_by_category(category_title)
    joins("INNER JOIN categories ON tests.category_id = categories.id").
      where("categories.title = ? ", category_title ).
      order("tests.title DESC").
      pluck("tests.title")
  end

end

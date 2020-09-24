class Test < ApplicationRecord
  # belongs_to :category

  def self.list_by_category(category_title)
    # В замечании к прошлому заданяю меня попросили убрать связи из модели
    # по этой причине не использую 'joins'
    current_category = Category.find_by(title: category_title)
    return Test.where(category_id: current_category.id).order(title: :desc).pluck(:title) if current_category
    []
  end

end

class Category < ApplicationRecord
  default_scope { order(:name) }

  has_many :tests, dependent: :destroy

  validates :title, presence: true

end

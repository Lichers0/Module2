class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  validates :title, presence: true

  scope :order_name_asc, -> { order(:name) }
end

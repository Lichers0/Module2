class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates :url, presence: true

  def hash
    self.url.scan(/\w+$/).first
  end
end

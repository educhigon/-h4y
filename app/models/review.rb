class Review < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :rating, presence: true
end

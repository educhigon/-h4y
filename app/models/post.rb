class Post < ApplicationRecord
  belongs_to :user\

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy
end

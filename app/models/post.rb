class Post < ApplicationRecord
  belongs_to :user\

  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reviews, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_title_and_content, against: [:title, :content]
end

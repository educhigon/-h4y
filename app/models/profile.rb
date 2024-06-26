class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :profile_picture
  has_many :taggings, as: :taggable
  has_many :tags, through: :taggings

  include PgSearch::Model
  pg_search_scope :search_by_name_and_bio,
  against: [:name, :bio],
  using: {
    tsearch: { prefix: true }
  }
end

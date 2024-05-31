class Tag < ApplicationRecord
  include PgSearch::Model
  has_many :taggings
  has_many :taggable_posts, through: :taggings, source: :taggable, source_type: 'Post'
  has_many :taggable_users, through: :taggings, source: :taggable, source_type: 'User'

  pg_search_scope :search_by_name,
                  against: :name,
                  using: {
                    tsearch: { prefix: true }
                  }

  def taggable_posts
    posts
  end
end

class Tag < ApplicationRecord
  has_many :taggings
  has_many :taggable_posts, through: :taggings, source: :taggable, source_type: 'Post'
  has_many :taggable_users, through: :taggings, source: :taggable, source_type: 'User'
end

class Profile < ApplicationRecord
  belongs_to :user

  include PgSearch::Model

  pg_search_scope :search_by_username_and_bio,
                  against: [:username, :bio],
                  using: {
                    tsearch: { prefix: true }
                  }
end

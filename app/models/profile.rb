class Profile < ApplicationRecord
  belongs_to :user

  include PgSearch::Model
  pg_search_scope :search_by_name_and_bio, against: [:name, :bio]
end

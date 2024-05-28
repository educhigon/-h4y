class Favorite < ApplicationRecord
  belongs_to :users
  belongs_to :posts
end

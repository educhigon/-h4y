class Tagging < ApplicationRecord
  belongs_to :tag
  belongs_to :taggable, polymorphic: true
  validates :taggable_type, inclusion: { in: ['Post', 'User'] }

end

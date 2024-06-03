class Tag < ApplicationRecord
  include PgSearch::Model
  has_many :taggings
  has_many :taggable_posts, through: :taggings, source: :taggable, source_type: 'Post'
  has_many :taggable_users, through: :taggings, source: :taggable, source_type: 'User'
  validates :name, inclusion: { in: ["Anxiety", "Stress", "Depression", "Mindfulness", "Wellness", "Mental Health Therapy", "Resilience", "Self-care", "Psychology", "Happiness", "Diabetes Prevention", "Glucose", "Insulin", "Diet", "Glycemic", "Fitness", "Foot Care", "Type 1 Diabetes", "Type 2 Diabetes", "Cardio", "Heart Diet", "Cholesterol", "Blood Pressure", "Heart Care", "Physical Rehab", "Stress", "Surgery", "Heart Rate", "Heart Health", "Density", "Calcium", "Osteoporosis", "Joints", "Arthritis", "Fracture", "Vitamins", "Physical Therapy", "Aging", "Bone Health", "Nutrition", "Exercise", "Checkups", "Hydration", "Sleep", "Weight", "Seasonal", "Prevention", "Vaccines", "Health"] }

  pg_search_scope :search_by_name,
                  against: :name,
                  using: {
                    tsearch: { prefix: true }
                  }

  def taggable_posts
    posts
  end
end

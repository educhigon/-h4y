class HealthDatum < ApplicationRecord
  belongs_to :user

  validates :days_indoors, inclusion: { in: ['Go out Every day', '1-14 days', '15-30 days', '31-60 days', 'More than 2 months'] }
  validates :gender, inclusion: { in: ["Male", "Female", "Others"] }
  validates :days_indoors, inclusion: { in: ["Go out Every day", "1-14 days", "15-30 days", "31-60 days", "More than 2 months"] }
  validates :country, inclusion: { in: ['United States', 'Poland', 'Australia', 'Canada', 'United Kingdom',
  'South Africa', 'Sweden', 'New Zealand', 'Netherlands', 'India',
  'Belgium', 'Ireland', 'France', 'Portugal', 'Brazil', 'Costa Rica',
  'Russia', 'Germany', 'Switzerland', 'Finland', 'Israel', 'Italy',
  'Bosnia and Herzegovina', 'Singapore', 'Nigeria', 'Croatia',
  'Thailand', 'Denmark', 'Mexico', 'Greece', 'Moldova', 'Colombia',
  'Georgia', 'Czech Republic', 'Philippines'] }
  # validates :self_employed, inclusion: { in: ["Yes", "No"] }
  # validates :smoker, inclusion: { in: ["Yes", "No"] }
  # validates :alcohol_consumer, inclusion: { in: ["Moderate", "None"] }
  # validates :sun_exposure, inclusion: { in: ["Sufficient", "Insufficient"] } # ??
  # validates :active, inclusion: { in: ["Active", "Sedentary"] }
  # validates :dairy_intake, inclusion: { in: ["Low", "Adequate"] }
  validates :sleeping_hours, inclusion: { in: (0..24) }
  validates :age, numericality: { only_integer: true }
  validates :weight, numericality: { only_integer: true }
  validates :height, numericality: { only_integer: true }

  # after_validation assign_tags_to_user(map_cats_to_tags(map_response_to_cats(api_call_tags(self))))

  after_validation :tags_for_user_smile

  private

  def self.genders
    validators_on(:gender).first.options[:in]
  end

  def self.countries
    validators_on(:country).first.options[:in]
  end

  def self.indoors
    validators_on(:days_indoors).first.options[:in]
  end



  def tags_for_user_smile
    p "👽👽☠☠👽👻"
    response = api_call_tags
    categories = map_response_to_cats(response)
    tags = map_cats_to_tags(categories)
    assign_tags_to_user(tags)
  end

  def api_call_tags
    # self = User.last.health_datum
    url = "https://mvp-nguajhe5yq-ew.a.run.app/categorize"
    body = {
      "occupation": self.occupation,
      "gender": self.gender,
      "days_indoors": self.days_indoors,
      "self_employed": self.self_employed ? "Yes" : "No",
      "smoking": self.smoker ? "Yes" : "No",
      "alcohol_consumption": self.alcohol_consumer ? "Moderate" : "None",
      "sun_exposure": self.sun_exposure ? "Sufficient" : "Insufficient",
      "activity": self.active ? "Active" : "Sedentary",
      "dairy_intake": self.dairy_intake ? "Low" : "Adequate",
      "sleeping_hrs": self.sleeping_hours.floor.to_s,
      "age": self.age,
      "weight": self.weight,
      "height": self.weight,
      "country": self.country
    }

    headers = {
      "accept": "application/json",
      "Content-Type": "application/json",
    }

    response = HTTParty.post(url, body: body.to_json, headers: headers)
    p response
    return response
  end

  def map_response_to_cats(response)
    cats = []
    response.each do |key, value|
      if value == "YES"
        cats << key.to_s
      end
    end
    return cats
  end

  def map_cats_to_tags(cats)
    tags_by_category = {
      mental_health: [
        "Anxiety", "Stress", "Depression", "Mindfulness", "Wellness",
        "Mental Health Therapy", "Resilience", "Self-care", "Psychology", "Happiness"
      ],
      diabetes: [
        "Diabetes Prevention", "Glucose", "Insulin", "Diet", "Glycemic",
        "Fitness", "Foot Care", "Type 1 Diabetes", "Type 2 Diabetes", "Cardio"
      ],
      heart_health: [
        "Heart Diet", "Cholesterol", "Blood Pressure", "Heart Care", "Physical Rehab",
        "Stress", "Surgery", "Heart Rate", "Heart Health", "Density"
      ],
      osteoporosis: [
        "Calcium", "Osteoporosis", "Joints", "Arthritis", "Fracture",
        "Vitamins", "Physical Therapy", "Aging", "Bone Health", "Nutrition"
      ],
      generic: [
        "Exercise", "Checkups", "Hydration", "Sleep", "Weight",
        "Seasonal", "Prevention", "Vaccines", "Health", "Self-care"
      ]
    }
    tags = []

    cats.map do |cat|
      tags_by_category.each do |key, value|
        p cat
        p key
        p "😎"
        if cat.to_sym == key.to_sym
          tags.concat(value)
        end
      end
    end
    return tags
  end

  def assign_tags_to_user(tags)
    p tags
    user = self.user
    p "🤡🤡🤡"
    Tagging.where(taggable_type: "User")&.where(taggable_id: self.user&.id)&.destroy_all
    p "🤡🤡🤡"
    tags.each do |tag|
      p "🤗🙂🤗"
      p tags
      p "🤔🤔"
      p tag
      p tag.class
      p "😁"

      Tagging.create!(taggable_id: user.id, taggable_type: "User", tag_id: Tag.find_by(name: tag).id)
      p "🥱"
    end
  end
end

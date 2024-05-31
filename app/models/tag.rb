class Tag < ApplicationRecord


  private

  tags_by_category = {
    "Mental_Health": [
        "Anxiety", "Stress", "Depression", "Mindfulness", "Wellness",
        "Therapy", "Resilience", "Self-care", "Psychology", "Happiness"
    ],
    "Diabetes": [
        "Diabetes", "Glucose", "Insulin", "Diet", "Glycemic",
        "Fitness", "Feet", "Diabetes Prevent", "Type 1", "Type 2"
    ],
    "Heart_Health": [
        "Cardio", "Heart Diet", "Cholesterol", "Blood Pressure", "Heart Care",
        "Rehab", "Stress", "Surgery", "Pulse", "Heart"
    ],
    "Skeleton": [
        "Density", "Calcium", "Osteoporosis", "Joints", "Arthritis",
        "Fracture", "Vitamins", "Therapy", "Aging", "Bones"
    ],
    "General_Health": [
        "Nutrition", "Exercise", "Checkups", "Water", "Sleep",
        "Weight", "Seasonal", "Prevention", "Vaccines", "Overall Health"
    ]
}

end

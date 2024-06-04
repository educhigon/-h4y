p "Destroy All"
Comment.destroy_all
Favorite.destroy_all
Post.destroy_all
Profile.destroy_all
Review.destroy_all
User.destroy_all
Tag.destroy_all
Tagging.destroy_all
HealthDatum.destroy_all

p "Database clean"

def new_client
  return OpenAI::Client.new
end

def api_call(new_client)
  tags = ["Anxiety", "Stress", "Depression", "Mindfulness", "Wellness", "Mental Health Therapy", "Resilience", "Self-care", "Psychology", "Happiness", "Diabetes Prevention", "Glucose", "Insulin", "Diet", "Glycemic", "Fitness", "Foot Care", "Type 1 Diabetes", "Type 2 Diabetes", "Cardio", "Heart Diet", "Cholesterol", "Blood Pressure", "Heart Care", "Physical Rehab", "Stress", "Surgery", "Heart Rate", "Heart Health", "Density", "Calcium", "Osteoporosis", "Joints", "Arthritis", "Fracture", "Vitamins", "Physical Therapy", "Aging", "Bone Health", "Nutrition", "Exercise", "Checkups", "Hydration", "Sleep", "Weight", "Seasonal", "Prevention", "Vaccines", "Health"]
  tags_five = tags.sample(5)
  num = rand(0..5) + rand(1..10) + rand(1..10) + rand(1..15)
  style = [
    "a touch more casual than usual",
    "however you like",
    "professional and doctor like",
    "you're hot shit",
    "a top tier influencer on this platform",
    "a mid tier influencer on this platform",
    "a bottom tier influencer on this platform with no followers whatsoever. Pathetic really. (but its just a persona don't take it to heart!)",
    "50cent. (but dont call yourself 50cent) Use 'shawty' at least once"
  ]
  emojis = rand(1..8) == 1 ? "4. Use emojis" : ""

  begin
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content:
        "Write a post for a health/lifestyle social media app.
        Use these 5 tags: #{tags_five} and have the topic be somewhat related.
        Choose a topic from broad range of health and lifestyle subjects.
        Avoid focusing repeatedly on the same topics like mindfulness or diabetes;
        aim for a diverse set of topics.

        Rules for the post:
        1. Be very random and specfic in your choice of topic.
        2. The post should be around #{num} sentences long.
        3. Your persona for this post is: #{style.sample}.
        #{emojis}

        Please generate the post with the exact structure specified below.
        It is crucial that this format with the specified markers is adhered to strictly:

        Title:
        <title>
        %%%
        Content:
        <content>
        "
        }]
    })
    return chaptgpt_response["choices"][0]["message"]["content"]
  rescue => e
    p "error API: #{e.message}"
    nil
  end
end

def read_response(response)
  title_marker = "Title: "
  content_marker = "%%%"
  skip = "Content: "

  content_start = response.index(content_marker) + content_marker.length

  title = response[title_marker.length..response.index(content_marker) - 1]

  content = response[(content_start + skip.length)..-1]
  post_proc_content = content.gsub('#', '!').strip

  unless title.empty? && content.empty?
    begin
      fresh_post = Post.create!(title: title, content: post_proc_content, user: User.all.sample)
    rescue => e
      puts "error saving post: #{e.message}"
    end
  end
end

############################################################################
############################################################################
############################################################################
############################################################################
############################################################################

p "Creating users"
a = User.create!(email: "bobusa@gmail.com", password: "password")
b = User.create!(email: "lucas@lewagon.com", password: "password")
c = User.create!(email: "emma@test.com", password: "123456")
d = User.create!(email: "iratxe@lewagon.com", password: "password")
# p "Users created"

blob = File.open("app/assets/images/H4you.png", 'rb')

p "Creating posts"

test_post = Post.create!( title: "Apples good", content: "An apple a day keeps the doctor away", user: b)
# test_post.images.attach(io: blob, filename: "H4you.png", content_type: "image/png" )
# test_post.images.attach(io: blob, filename: "another_image.png", content_type: "image/png" )

post = Post.create!(title: "Just move LOL", content: "🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️", user: c)
# post.images.attach(io: blob, filename: "H4you.png", content_type: "image/png" )
# post.images.attach(io: blob, filename: "another_image.png", content_type: "image/png" )

post = Post.create!(title: "Coffee bad :(", content: "Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc ", user: a)
# post.images.attach(io: blob, filename: "H4you.png", content_type: "image/png" )
# post.images.attach(io: blob, filename: "another_image.png", content_type: "image/png" )

post = Post.create!(title: "Potato good", content: "Potatos are like apples", user: b)
# post.images.attach(io: blob, filename: "H4you.png", content_type: "image/png" )
# post.images.attach(io: blob, filename: "another_image.png", content_type: "image/png" )

# 2.times do
#   response = api_call(client)
#   read_response(response)
# end

p "Creating Comments"
Comment.create!(content: "Good stuff :) !", user: a, post: test_post)
Comment.create!(content: "WEAK POST! I could do better", user: d, post: test_post)
Comment.create!(content: "I just throw apples at homeless children 😎", user: c, post: test_post)
posts = Post.all.to_a - [test_post]
posts.each do |post|
  5.times do
    Comment.create!(content: ('a'..'z').to_a.sample(26).join, user: User.all.sample, post: post)
  end
end


# review and favorite generation will break once validation is in place
p "Creating Reviews"
xx = User.all.count * Post.all.count
rating = [-1, 1]
xx.times do
  Review.create!(rating: rating.sample, post: Post.all.sample, user: User.all.sample)
end

p "Creating Favorites"
xx.times do
  Favorite.create!(post: Post.all.sample, user: User.all.sample)
end

p "tags and taggings 😮"
tags = ["Anxiety", "Stress", "Depression", "Mindfulness", "Wellness", "Mental Health Therapy", "Resilience", "Self-care", "Psychology", "Happiness", "Diabetes Prevention", "Glucose", "Insulin", "Diet", "Glycemic", "Fitness", "Foot Care", "Type 1 Diabetes", "Type 2 Diabetes", "Cardio", "Heart Diet", "Cholesterol", "Blood Pressure", "Heart Care", "Physical Rehab", "Stress", "Surgery", "Heart Rate", "Heart Health", "Density", "Calcium", "Osteoporosis", "Joints", "Arthritis", "Fracture", "Vitamins", "Physical Therapy", "Aging", "Bone Health", "Nutrition", "Exercise", "Checkups", "Hydration", "Sleep", "Weight", "Seasonal", "Prevention", "Vaccines", "Health"]
tags.each do |tag|
  Tag.create!(name: tag)
end


User.all.each do |user|
  5.times do
    Tagging.create!(taggable_type: "User", taggable_id: user.id, tag: Tag.all.sample)
  end
end
p "#{Tagging.count} 🤣😂😁😁😁"
#sample health data
country = ['United States', 'Poland', 'Australia', 'Canada', 'United Kingdom',
  'South Africa', 'Sweden', 'New Zealand', 'Netherlands', 'India',
  'Belgium', 'Ireland', 'France', 'Portugal', 'Brazil', 'Costa Rica',
  'Russia', 'Germany', 'Switzerland', 'Finland', 'Israel', 'Italy',
  'Bosnia and Herzegovina', 'Singapore', 'Nigeria', 'Croatia',
  'Thailand', 'Denmark', 'Mexico', 'Greece', 'Moldova', 'Colombia',
  'Georgia', 'Czech Republic', 'Philippines']
gender = ["Male", "Female", "Others"]
# country = "France"
occupation = "Student"
days_indoors = ["Go out Every day", "1-14 days", "15-30 days", "More than 2 months"]
self_employed = ["Yes", "No"]
smoker = ["Yes", "No"]
alcohol_consumer = ["Moderate", "None"]
sun_exposure = ["Sufficient", "Insufficient"] #, " Insufficient"
active = ["Active", "Sedentary"]
dairy_intake = ["Low", "Adequate"]
sleeping_hours = rand(0..24)
age = rand(18..100)
weight = rand(40..140)
height = rand(140..210)

p "Creating Profiles"
User.all.each do |user|
  # Profile.create!(user: user, name: user.email.split('@')[0], bio: ('a'..'z').to_a.sample(50).join).profile_picture.attach(io: blob, filename: "H4you.png", content_type: "image/png" )
  Profile.create!(user: user, name: user.email.split('@')[0], bio: ('a'..'z').to_a.sample(50).join)
  HealthDatum.create!(
    occupation: occupation,
    gender: gender.sample,
    days_indoors: days_indoors.sample,
    self_employed: self_employed.sample,
    smoker: smoker.sample,
    alcohol_consumer: alcohol_consumer.sample,
    sun_exposure: sun_exposure.sample,
    active: active.sample,
    dairy_intake: dairy_intake.sample,
    sleeping_hours: "#{rand(0..24)}",
    age: rand(18..100),
    weight: rand(40..140),
    height: rand(14..210),
    country: country.sample,
    user: user
  )
end
p "#{Tagging.count} 🤣😂😁😁😁"

def example
  {"occupation": "Student",
    "gender": "Male",
    "days_indoors": "1-14 days",
    "self_employed": "Yes",
    "smoking": "No",
    "alcohol_consumption": "Moderate",
    "sun_exposure": "Sufficient",
    "activity": "Active",
    "dairy_intake":"Low",
    "sleeping_hrs":"8",
    "age":32,
    "weight":67,
    "height":163,
    "country":"United States"
  }
end


Post.all.each do |post|
  5.times do
    Tagging.create!(taggable_type: "Post", taggable_id: post.id, tag: Tag.all.sample)
  end
end

p "             "
p "#############"
p "             "
p "Database contains:"
p "Users: #{'🍌' * User.count}"
p "Posts: #{'🍌' * Post.count}"
p "Comments: #{'🍌' * Comment.count}"
p "Reviews: #{'🍌' * Review.count}"
p "Favorites: #{'🍌' * Favorite.count}"
p "Profiles: #{'🍌' * Profile.count}"
p "HealthDatum: #{'🍌' * HealthDatum.count}"
p "Tags: #{'🍌' * Tag.count}"
p "Taggings: #{'🍌' * Tagging.count}"

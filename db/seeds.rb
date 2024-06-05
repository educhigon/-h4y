require "open-uri"
p "Destroy All"
HealthDatum.destroy_all
Comment.destroy_all
Favorite.destroy_all
Post.destroy_all
Profile.destroy_all
Review.destroy_all
User.destroy_all
Tag.destroy_all
Tagging.destroy_all
p "Database clean"

topics = [
  "Herbal Remedies: Natural Healing :herb:",
  "Boost Immunity Naturally :muscle:",
  "Benefits of Acupuncture :mag:",
  "Nature's Best Nutrition :green_apple:",
  "Mindful Meditation :man_in_lotus_position:",
  "Traditional Medicine Wisdom :old_key:",
  "Organic Foods & Health :ear_of_rice:",
  "Balancing Body & Mind :scales:",
  "Soothing Aromatherapy :cherry_blossom:",
  "Herbal Tea Blends :coffee:",
  "Superfoods for Health :broccoli:",
  "Holistic Skincare :star2:",
  "Healing Homeopathy :pill:",
  "Stress Reduction Techniques :brain:",
  "Yoga for Balance :man_in_lotus_position:"
]
images = ["https://res.cloudinary.com/dllwjjfax/image/upload/v1717578474/h4you/y1jbpypl0xj3p4wuuhxt.png", "https://res.cloudinary.com/dllwjjfax/image/upload/v1717578474/h4you/ibfb77vv1fdqemqklr7b.png", "https://res.cloudinary.com/dllwjjfax/image/upload/v1717578474/h4you/n12jtzmxyll2j0ho489d.png","https://res.cloudinary.com/dllwjjfax/image/upload/v1717578475/h4you/l7sycltfyft2aeptzjw9.png","https://res.cloudinary.com/dllwjjfax/image/upload/v1717578474/h4you/otozqnazn4mqcwqjeyx9.png","https://res.cloudinary.com/dllwjjfax/image/upload/v1717578474/h4you/ucdddviwywvuaamrstdf.png","https://res.cloudinary.com/dllwjjfax/image/upload/v1717578475/h4you/uiadacncmonwm2dymk8i.png","https://res.cloudinary.com/dllwjjfax/image/upload/v1717578474/h4you/c8rtvqfx8btyrwqd264b.png","https://res.cloudinary.com/dllwjjfax/image/upload/v1717578474/h4you/tzvjyhrhojzyce6kbodm.png","https://res.cloudinary.com/dllwjjfax/image/upload/v1717578475/h4you/yjdalyik4nij7lqyvtxu.png","https://res.cloudinary.com/dllwjjfax/image/upload/v1717578475/h4you/tyx9v2glxjobqnasyvqy.png", "https://res.cloudinary.com/dllwjjfax/image/upload/v1717578475/h4you/az9ywsx55dadwvlrerm2.png", "https://res.cloudinary.com/dllwjjfax/image/upload/v1717578475/h4you/s6xoyb6voc2e4uwojeca.png", "https://res.cloudinary.com/dllwjjfax/image/upload/v1717578476/h4you/pnye6gn0ovmvkfpglzva.png", "https://res.cloudinary.com/dllwjjfax/image/upload/v1717578476/h4you/ocx2dkenrjekubsegoo8.png"]

client = OpenAI::Client.new

def api_call(client)
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
  prompt = "Write a post for a health/lifestyle social media app.
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

  begin
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content:
        prompt
        }]
    })
    return chaptgpt_response["choices"][0]["message"]["content"]
  rescue => e
    p "error API: #{e.message}"
    nil
  end
end

def api_call_with_topic(client, topic)
  p "😘"
  # tags = ["Anxiety", "Stress", "Depression", "Mindfulness", "Wellness", "Mental Health Therapy", "Resilience", "Self-care", "Psychology", "Happiness", "Diabetes Prevention", "Glucose", "Insulin", "Diet", "Glycemic", "Fitness", "Foot Care", "Type 1 Diabetes", "Type 2 Diabetes", "Cardio", "Heart Diet", "Cholesterol", "Blood Pressure", "Heart Care", "Physical Rehab", "Stress", "Surgery", "Heart Rate", "Heart Health", "Density", "Calcium", "Osteoporosis", "Joints", "Arthritis", "Fracture", "Vitamins", "Physical Therapy", "Aging", "Bone Health", "Nutrition", "Exercise", "Checkups", "Hydration", "Sleep", "Weight", "Seasonal", "Prevention", "Vaccines", "Health"]
  # tags_five = tags.sample(5)
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
  emojis = rand(1..5) == 1 ? "3. Use emojis" : ""
  prompt = "Write a post for a health/lifestyle social media app.
  The title for this post: #{topic}
  Base the content on this title.
  Be very specific in your writing of the content.

  Rules for the post:
  1. The post should be around #{num} sentences long.
  2. Your persona for this post is: #{style.sample}.
  #{emojis}

  Please generate the post with the exact structure specified below.
  It is crucial that this format with the specified markers is adhered to strictly:
  Title:
  <title>
  %%%
  Content:
  <content>
  "

  begin
    chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content:
        prompt
        }]
    })
    p chaptgpt_response
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
  return fresh_post
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

p "Creating posts"
test_post = Post.create!( title: "Apples good", content: "An apple a day keeps the doctor away", user: b)
Post.create!(title: "Just move LOL", content: "🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️", user: c)
Post.create!(title: "Coffee bad :(", content: "Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc ", user: a)
Post.create!(title: "Potato good", content: "Potatos are like apples", user: b)

#API call to make post with just title and content
# 2.times do
#   response = api_call(client)
#   read_response(response)
# end

# winning
#API call generating post content fitted to mahdis images
topics.each_with_index do |topic, index|
  p topics.length
  p images.length
  p "starting topics loops num:"
  p index
  response = api_call_with_topic(client, topic)
  post_without_image = read_response(response)
  img = URI.open(images[index])
  post_without_image.photos.attach(io: img, filename: "", content_type: "image/png")
  p "this worked #{index} 😅" if post_without_image.save
end

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

#review and favorite generation will break once validation is in place
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

p "Tags and Taggings 😮"
tags = ["Anxiety", "Stress", "Depression", "Mindfulness", "Wellness", "Mental Health Therapy", "Resilience", "Self-care", "Psychology", "Happiness", "Diabetes Prevention", "Glucose", "Insulin", "Diet", "Glycemic", "Fitness", "Foot Care", "Type 1 Diabetes", "Type 2 Diabetes", "Cardio", "Heart Diet", "Cholesterol", "Blood Pressure", "Heart Care", "Physical Rehab", "Stress", "Surgery", "Heart Rate", "Heart Health", "Density", "Calcium", "Osteoporosis", "Joints", "Arthritis", "Fracture", "Vitamins", "Physical Therapy", "Aging", "Bone Health", "Nutrition", "Exercise", "Checkups", "Hydration", "Sleep", "Weight", "Seasonal", "Prevention", "Vaccines", "Health"]
tags.each do |tag|
  Tag.create!(name: tag)
end

User.all.each do |user|
  5.times do
    Tagging.create!(taggable_type: "User", taggable_id: user.id, tag: Tag.all.sample)
  end
end

#sample health data
country = ['United States', 'Poland', 'Australia', 'Canada', 'United Kingdom',
  'South Africa', 'Sweden', 'New Zealand', 'Netherlands', 'India',
  'Belgium', 'Ireland', 'France', 'Portugal', 'Brazil', 'Costa Rica',
  'Russia', 'Germany', 'Switzerland', 'Finland', 'Israel', 'Italy',
  'Bosnia and Herzegovina', 'Singapore', 'Nigeria', 'Croatia',
  'Thailand', 'Denmark', 'Mexico', 'Greece', 'Moldova', 'Colombia',
  'Georgia', 'Czech Republic', 'Philippines']
gender = ["Male", "Female", "Others"]
occupation = "Student"
days_indoors = ["Go out Every day", "1-14 days", "15-30 days", "More than 2 months"]
self_employed = [true, false]
smoker = [true, false]
alcohol_consumer = [true, false]
sun_exposure = [true, false]
active = [true, false]
dairy_intake = [true, false]
sleeping_hours = rand(0..24)
age = rand(18..100)
weight = rand(40..140)
height = rand(140..210)

p "Creating Profiles and HDs"
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

# def example
#   {"occupation": "Student",
#     "gender": "Male",
#     "days_indoors": "1-14 days",
#     "self_employed": "Yes",
#     "smoking": "No",
#     "alcohol_consumption": "Moderate",
#     "sun_exposure": "Sufficient",
#     "activity": "Active",
#     "dairy_intake":"Low",
#     "sleeping_hrs":"8",
#     "age":32,
#     "weight":67,
#     "height":163,
#     "country":"United States"
#   }
# end



Post.all.each do |post|
  5.times do
    p post
    p "test"
    x = Tagging.create!(taggable_type: "Post", taggable_id: post.id, tag: Tag.all.sample)
    p x
  end
end

user_without_hd = User.create!(email: "bruno@bruno.com", password: "password")
Profile.create!(user: user_without_hd, name: user_without_hd.email.split('@')[0], bio: ('a'..'z').to_a.sample(50).join)

p "##########################################################################################"
p "Database contains:"
p "Users: #{'🍌' * User.count}"
p "Posts: #{'🍌' * Post.count}"
p "Comments: #{'🍌' * Comment.count}"
p "Reviews: #{'🍌' * Review.count}"
p "Favorites: #{'🍌' * Favorite.count}"
p "Profiles: #{'🍌' * Profile.count}"
p "HealthDatum: #{'🍌' * HealthDatum.count}"
p "Tags: #{'🍌' * Tag.count}"
p "Tags: #{ Tag.count}"
p "Taggings: #{'🍌' * Tagging.count}"
p "Taggings: #{Tagging.count}"

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

# Cloudinary::Uploader.upload("/home/gonzalo/code/educhigon/ h4y/app/assets/images/DS_explained.png")
# Cloudinary::Uploader.upload("/home/gonzalo/code/educhigon/ h4y/app/assets/images/escobar1.png")
# Cloudinary::Uploader.upload("/home/gonzalo/code/educhigon/ h4y/app/assets/images/escobar2.png")
# Cloudinary::Uploader.upload("/home/gonzalo/code/educhigon/ h4y/app/assets/images/escobar3.png")
# Cloudinary::Uploader.upload("/home/gonzalo/code/educhigon/ h4y/app/assets/images/escobar3.png")
# Cloudinary::Uploader.upload("/home/gonzalo/code/educhigon/ h4y/app/assets/images/reinvigorate.png")
# Cloudinary::Uploader.upload("/home/gonzalo/code/educhigon/ h4y/app/assets/images/streching1.png")
# Cloudinary::Uploader.upload("/home/gonzalo/code/educhigon/ h4y/app/assets/images/streching2.png")
# Cloudinary::Uploader.upload("/home/gonzalo/code/educhigon/ h4y/app/assets/images/stressed.png")
# Cloudinary::Uploader.upload("/home/gonzalo/code/educhigon/ h4y/app/assets/images/yoga1.png")
# Cloudinary::Uploader.upload("/home/gonzalo/code/educhigon/ h4y/app/assets/images/yoga2.png")
# Cloudinary::Uploader.upload("/home/gonzalo/code/educhigon/ h4y/app/assets/images/yoga3.png")
# Cloudinary::Uploader.upload("/home/gonzalo/code/educhigon/ h4y/app/assets/images/yoga4.png")





topics = [
  "Herbal Remedies: Natural Healing",
  "Boost Immunity Naturally",
  "Benefits of Acupuncture",
  "Nature's Best Nutrition",
  "Mindful Meditation",
  "Traditional Medicine Wisdom",
  "Organic Foods & Health",
  "Balancing Body & Mind",
  "Soothing Aromatherapy",
  "Herbal Tea Blends",
  "Superfoods for Health",
  "Holistic Skincare",
  "Healing Homeopathy",
  "Stress Reduction Techniques",
  "Yoga for Balance:"
]
images = ["https://res.cloudinary.com/dllwjjfax/image/upload/v1717578474/h4you/y1jbpypl0xj3p4wuuhxt.png",
 "https://res.cloudinary.com/dllwjjfax/image/upload/v1717578474/h4you/ibfb77vv1fdqemqklr7b.png",
 "https://res.cloudinary.com/dllwjjfax/image/upload/v1717578474/h4you/n12jtzmxyll2j0ho489d.png",
"https://res.cloudinary.com/dllwjjfax/image/upload/v1717578475/h4you/l7sycltfyft2aeptzjw9.png",
"https://res.cloudinary.com/dllwjjfax/image/upload/v1717578474/h4you/otozqnazn4mqcwqjeyx9.png",
"https://res.cloudinary.com/dllwjjfax/image/upload/v1717578474/h4you/ucdddviwywvuaamrstdf.png",
"https://res.cloudinary.com/dllwjjfax/image/upload/v1717578475/h4you/uiadacncmonwm2dymk8i.png",
"https://res.cloudinary.com/dllwjjfax/image/upload/v1717578474/h4you/c8rtvqfx8btyrwqd264b.png",
"https://res.cloudinary.com/dllwjjfax/image/upload/v1717578474/h4you/tzvjyhrhojzyce6kbodm.png",
"https://res.cloudinary.com/dllwjjfax/image/upload/v1717578475/h4you/yjdalyik4nij7lqyvtxu.png",
"https://res.cloudinary.com/dllwjjfax/image/upload/v1717578475/h4you/tyx9v2glxjobqnasyvqy.png",
 "https://res.cloudinary.com/dllwjjfax/image/upload/v1717578475/h4you/az9ywsx55dadwvlrerm2.png",
 "https://res.cloudinary.com/dllwjjfax/image/upload/v1717578475/h4you/s6xoyb6voc2e4uwojeca.png",
 "https://res.cloudinary.com/dllwjjfax/image/upload/v1717578476/h4you/pnye6gn0ovmvkfpglzva.png",
 "https://res.cloudinary.com/dllwjjfax/image/upload/v1717578476/h4you/ocx2dkenrjekubsegoo8.png"]

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
a = User.create!(email: "kat@gmail.com", password: "password")
a1 = Profile.where(user_id: a.id).first
img = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696334260/xeoh9bn2dq3runng1m4v.jpg')
a1.profile_picture.attach(io: img, filename: "", content_type: "image/png")
a1.update!(name:'Kat', bio: "Yoga is LIFE!")

b = User.create!(email: "lucas@lewagon.com", password: "password")
b1 = Profile.where(user_id: b.id).first
# img = File.open('/home/gonzalo/code/educhigon/ h4y/app/assets/images/lucas.png', "rb")
img = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696334260/xeoh9bn2dq3runng1m4v.jpg')

b1.profile_picture.attach(io: img, filename: "", content_type: "image/png")
b1.update!(name:'Lucas', bio: "Dogs have the best life - we should be like them")

c = User.create!(email: "emma@test.com", password: "123456")
c1 = Profile.where(user_id: c.id).first
# img = File.open('/home/gonzalo/code/educhigon/ h4y/app/assets/images/emma.png', "rb")
img = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696334260/xeoh9bn2dq3runng1m4v.jpg')

c1.profile_picture.attach(io: img, filename: "", content_type: "image/png")
c1.update!(name:'emma', bio: "Some say the answer for the meaning of life is 42.. For me is 👻")

d = User.create!(email: "emre@lewagon.com", password: "password")
d1 = Profile.where(user_id: d.id).first
# img = File.open('/home/gonzalo/code/educhigon/ h4y/app/assets/images/emre.png', "rb")
img = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696334260/xeoh9bn2dq3runng1m4v.jpg')

d1.profile_picture.attach(io: img, filename: "", content_type: "image/png")
d1.update!(name:'Emre', bio: "I wonder if the cactus have feelings")

e = User.create!(email: "josh@lewagon.com", password: "password")
e1 = Profile.where(user_id: e.id).first
# img = File.open('/home/gonzalo/code/educhigon/ h4y/app/assets/images/josh.png', "rb")
img = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696334260/xeoh9bn2dq3runng1m4v.jpg')

e1.profile_picture.attach(io: img, filename: "", content_type: "image/png")
e1.update!(name:'Josh', bio: "Baking and cooking are the best medicine")

p "Creating posts"
# test_post = Post.create!( title: "Apples good", content: "An apple a day keeps the doctor away", user: b)
# Post.create!(title: "Just move LOL", content: "🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️", user: c)
# Post.create!(title: "Coffee bad :(", content: "Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc ", user: a)
# Post.create!(title: "Potato good", content: "Potatos are like apples", user: b)

#API call to make post with just title and content
# 2.times do
#   response = api_call(client)
#   read_response(response)
# end



# winning
# API call generating post content fitted to mahdis images
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

# p "Creating Comments"
# Comment.create!(content: "Good stuff :) !", user: a, post: test_post)
# Comment.create!(content: "WEAK POST! I could do better", user: d, post: test_post)
# Comment.create!(content: "Hey! very interesting, how do I know more? 😎", user: c, post: test_post)

  # posts = Post.all.to_a - [test_post]
# posts.each do |post|
#   5.times do
#     Comment.create!(content: ('a'..'z').to_a.sample(26).join, user: User.all.sample, post: post)
#   end
# end

#review and favorite generation will break once validation is in place


# p "Creating Favorites"
# 10.times do
#   Favorite.create!(post: Post.all.sample, user: User.all.sample)
# end

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
gender = ["Male", "Female"]
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
  # Profile.create!(user: user, name: user.email.split('@')[0], bio: ('a'..'z').to_a.sample(50).join)
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
Profile.create!(user: user_without_hd, name: user_without_hd.email.split('@')[0], bio: "I'm curious.. how does this app work?!")


####################
#################### SPECIAL POSTS
####################

post = Post.new(
  title: "You'll never believe how good this streching really is",
  content: "If you suffer from backpain, or want a quick pain release you definitelly need to check out this streching. ",
  user: e)

img = URI.open('https://res.cloudinary.com/ddzfjc1xy/image/upload/v1717700270/n29ibz7hjs87vhbh4ofb.jpg')
post.photos.attach(io: img, filename: "", content_type: "image/png")
img = URI.open('https://res.cloudinary.com/ddzfjc1xy/image/upload/v1717700271/jlga5mgcgvjiv6kmnahk.jpg')
post.photos.attach(io: img, filename: "", content_type: "image/png")
post.save

Comment.create!(content: "Wow! That is relaxing!", user: d, post: post)
Comment.create!(content: "Good stuff :) !", user: b, post: post)
Comment.create!(content: "Great exercise! I would also recommend to always do some prevention exercises 😊", user: a, post: post)

5.times do
  Tagging.create!(taggable_type: "Post", taggable_id: post.id, tag: Tag.all[0...50].sample)
end


post = Post.new(
  title: "Yoga can healp you enhance your life motivation!",
  content: "",
  user: a)
# img = File.open('/home/gonzalo/code/educhigon/ h4y/app/assets/images/yoga4.png', "rb")
img = URI.open('https://res.cloudinary.com/ddzfjc1xy/image/upload/v1717700277/hzoffat4iu1kvlhskixe.jpg')
post.photos.attach(io: img, filename: "", content_type: "image/png")
post.save

5.times do
  Tagging.create!(taggable_type: "Post", taggable_id: post.id, tag: Tag.all[0...50].sample)
end


post = Post.new(
  title: "Backpain? You've got to try yoga!",
  content: "",
  user: a)
img = URI.open('https://res.cloudinary.com/ddzfjc1xy/image/upload/v1717700274/jyclmexisl0ptpkof4ey.jpg')
post.photos.attach(io: img, filename: "", content_type: "image/png")
img = URI.open('https://res.cloudinary.com/ddzfjc1xy/image/upload/v1717700275/ylni5kcbxnpzlavywjjy.jpg')
post.photos.attach(io: img, filename: "", content_type: "image/png")
img = URI.open('https://res.cloudinary.com/ddzfjc1xy/image/upload/v1717700276/hmfgfgbhzvnjfq1zufbi.jpg')
post.photos.attach(io: img, filename: "", content_type: "image/png")
post.save


5.times do
  Tagging.create!(taggable_type: "Post", taggable_id: post.id, tag: Tag.all[0...50].sample)
end

post = Post.new(
  title: "Are you stressed? We have just the thing to help you",
  content: "",
  user: b)
img = URI.open('https://res.cloudinary.com/ddzfjc1xy/image/upload/v1717700273/fjzzl8pjtbioyddpnngn.jpg')
post.photos.attach(io: img, filename: "", content_type: "image/png")
post.save


5.times do
  Tagging.create!(taggable_type: "Post", taggable_id: post.id, tag: Tag.all[0...10].sample)
end

post = Post.new(
  title: "5 ways to reinvigorate after an exhaustive project",
  content: "",
  user: c)
img = URI.open('https://res.cloudinary.com/ddzfjc1xy/image/upload/v1717700269/w3ayg8vkudgvzk3ad5os.jpg')
post.photos.attach(io: img, filename: "", content_type: "image/png")
post.save

5.times do
  Tagging.create!(taggable_type: "Post", taggable_id: post.id, tag: Tag.all[0...10].sample)
end

post = Post.new(
  title: "How to overcome post Bootcamp depression ",
  content: "",
  user: d)
img = URI.open('https://res.cloudinary.com/ddzfjc1xy/image/upload/v1717700265/qozfkznuaxwayqgfabqf.jpg')
post.photos.attach(io: img, filename: "", content_type: "image/png")
img = URI.open('https://res.cloudinary.com/ddzfjc1xy/image/upload/v1717700264/wduezmckiefiv9jwdvrq.jpg')
post.photos.attach(io: img, filename: "", content_type: "image/png")
img = URI.open('https://res.cloudinary.com/ddzfjc1xy/image/upload/v1717700266/zizdqprlcnu0tlkugybg.jpg')
post.photos.attach(io: img, filename: "", content_type: "image/png")
post.save

5.times do
  Tagging.create!(taggable_type: "Post", taggable_id: post.id, tag: Tag.all[0...10].sample)
end

p "Creating Reviews"
rating = [-1, 1, 1, 1]
500.times do
  Review.create!(rating: rating.sample, post: Post.all.sample, user: User.all.sample)
end


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

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
  "Yoga for Balance"
]

images = [
  "https://res.cloudinary.com/dllwjjfax/image/upload/v1717578474/h4you/y1jbpypl0xj3p4wuuhxt.png",
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
  "https://res.cloudinary.com/dllwjjfax/image/upload/v1717578476/h4you/ocx2dkenrjekubsegoo8.png"
]

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
      random_user = User.where.not(id: User.first.id).order("RANDOM()").first
      fresh_post = Post.create!(title: title, content: post_proc_content, user: random_user)
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
b2 = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1680462063/p0d3z0nrbeuv8l7zs83h.jpg"
# img = File.open('/home/gonzalo/code/educhigon/ h4y/app/assets/images/lucas.png', "rb")
img = URI.open(b2)
b1.profile_picture.attach(io: img, filename: "", content_type: "image/png")
b1.update!(name:'Lucas', bio: "Dogs have the best life - we should be like them")


c = User.create!(email: "emma@test.com", password: "123456")
c1 = Profile.where(user_id: c.id).first
# img = File.open('/home/gonzalo/code/educhigon/ h4y/app/assets/images/emma.png', "rb")
c2 = "https://avatars.githubusercontent.com/u/90188399?v=4"
img = URI.open(c2)
c1.profile_picture.attach(io: img, filename: "", content_type: "image/png")
c1.update!(name:'Emma', bio: "Buh 👻")


d = User.create!(email: "emre@lewagon.com", password: "password")
d1 = Profile.where(user_id: d.id).first
d2 = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1691082719/avdhlgdrcsjmlzmrrmqd.jpg"
# img = File.open('/home/gonzalo/code/educhigon/ h4y/app/assets/images/emre.png', "rb")
img = URI.open(d2)
d1.profile_picture.attach(io: img, filename: "", content_type: "image/png")
d1.update!(name: 'Emre', bio: "I wonder if the cactus have feelings")


e = User.create!(email: "josh@lewagon.com", password: "password")
e1 = Profile.where(user_id: e.id).first
# img = File.open('/home/gonzalo/code/educhigon/ h4y/app/assets/images/josh.png', "rb")
e2 = "https://avatars.githubusercontent.com/u/111142848?v=4"
img = URI.open(e2)
e1.profile_picture.attach(io: img, filename: "", content_type: "image/png")
e1.update!(name: 'Josh', bio: "Baking and cooking are the best medicine")


f = User.create!(email: "iraxte@lewagon.com", password: "password")
f1 = Profile.where(user_id: f.id).first
f2 = "https://avatars.githubusercontent.com/u/65398654?v=4"
img = URI.open(f2)
f1.profile_picture.attach(io: img, filename: "", content_type: "image/png")
f1.update!(name: 'Iraxte', bio: "")


# g = User.create!(email: "napoleon@lewagon.com", password: "password")
# g1 = Profile.where(user_id: g.id).first
# g2 = "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4d/Napoleon_at_the_Great_St._Bernard_-_Jacques-Louis_David_-_Google_Cultural_Institute.jpg/800px-Napoleon_at_the_Great_St._Bernard_-_Jacques-Louis_David_-_Google_Cultural_Institute.jpg"
# img = URI.open(g2)
# g1.profile_picture.attach(io: img, filename: "", content_type: "image/png")
# g1.update!(name: 'Napoleon', bio: "Bonjour")

h = User.create!(email: "eli@lewagon.com", password: "password")
h1 = Profile.where(user_id: h.id).first
h2 = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1680533149/hfvshun4b9oolopypbtm.jpg"
img = URI.open(h2)
h1.profile_picture.attach(io: img, filename: "", content_type: "image/png")
h1.update!(name: 'Eli', bio: "Bonjour")

j = User.create!(email: "olivier@lewagon.com", password: "password")
j1 = Profile.where(user_id: j.id).first
j2 = "https://avatars.githubusercontent.com/u/32952612?v=4"
img = URI.open(j2)
j1.profile_picture.attach(io: img, filename: "", content_type: "image/png")
j1.update!(name: 'Olivier', bio: "Bonjour")

k = User.create!(email: "soojin@lewagon.com", password: "password")
k1 = Profile.where(user_id: k.id).first
k2 = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1688753896/ll1zsvlp4fnzkvfwo6av.jpg"
img = URI.open(k2)
k1.profile_picture.attach(io: img, filename: "", content_type: "image/png")
k1.update!(name: 'Soojin', bio: "Bonjour")

l = User.create!(email: "santi@lewagon.com", password: "password")
l1 = Profile.where(user_id: l.id).first
l2 = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1601461074/xrbi2mzjyawsdisknhdd.jpg"
img = URI.open(l2)
l1.profile_picture.attach(io: img, filename: "", content_type: "image/png")
l1.update!(name: 'Santi', bio: "Bonjour")

m = User.create!(email: "michelle@lewagon.com", password: "password")
m1 = Profile.where(user_id: m.id).first
m2 = "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1695388870/crobwmslxyfatclt8bqw.jpg"
img = URI.open(m2)
m1.profile_picture.attach(io: img, filename: "", content_type: "image/png")
m1.update!(name: 'Michelle', bio: "Bonjour")

# qwe
# FILLER POSTS
topics.each_with_index do |topic, index|
  p "starting topics loops num:"
  p "#{index + 1}/15"
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
#
p "Creating Tags and Taggings 😮"
tags = ["Anxiety", "Stress", "Depression", "Mindfulness", "Wellness", "Mental Health Therapy", "Resilience", "Self-care", "Psychology", "Happiness", "Diabetes Prevention", "Glucose", "Insulin", "Diet", "Glycemic", "Fitness", "Foot Care", "Type 1 Diabetes", "Type 2 Diabetes", "Cardio", "Heart Diet", "Cholesterol", "Blood Pressure", "Heart Care", "Physical Rehab", "Stress", "Surgery", "Heart Rate", "Heart Health", "Density", "Calcium", "Osteoporosis", "Joints", "Arthritis", "Fracture", "Vitamins", "Physical Therapy", "Aging", "Bone Health", "Nutrition", "Exercise", "Checkups", "Hydration", "Sleep", "Weight", "Seasonal", "Prevention", "Vaccines", "Health"]
tags.each do |tag|
  Tag.create!(name: tag)
end

Post.all.each do |post|
  # tags = Tag.all
  5.times do
    p post
    p "test"
    # tag_applied = tags.sample
    x = Tagging.create!(taggable_type: "Post", taggable_id: post.id, tag: Tag.all.sample)
    # tags - tag_applied.to_a
    p "😶 tags - tag test"
    # p tags
    p x
  end
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



# user_without_hd = User.create!(email: "bruno@bruno.com", password: "password")
# Profile.create!(user: user_without_hd, name: user_without_hd.email.split('@')[0], bio: "I'm curious.. how does this app work?!")

####################
#################### SPECIAL POSTS
####################

#### post 1 stretch from someone *** =we click on this
post = Post.new(
  title: "This One Stretch WILL BLOW YOUR MIND! 🤯",
  content: "Hey everyone! 🌟 Have you ever tried a stretch so good it almost instantly made you say 'ahh'? I'm talking about a game-changer for anyone battling back pain—the Cobra Pose! 🐍

  This incredible backbend not only alleviates tension in your lower back but also helps to improve your posture and flexibility. 🧘‍♂️ I've been adding this stretch to my morning routine, and the relief I feel each day is just mind-blowing! 🌅

  If you’re ready to transform your day and your backpain with just one simple move, give the Cobra Pose a shot. Trust me, your back will thank you! 🙏 Don’t forget to breathe deeply and enjoy the stretch. Let's get our flex on and kiss that back pain goodbye! 🚀",
  user: e)
# img = File.open('/home/gonzalo/code/educhigon/ h4y/app/assets/images/streching1.png', "rb")
img = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696334260/xeoh9bn2dq3runng1m4v.jpg')

post.photos.attach(io: img, filename: "", content_type: "image/png")
# img = File.open('/home/gonzalo/code/educhigon/ h4y/app/assets/images/streching2.png', "rb")
img = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696334260/xeoh9bn2dq3runng1m4v.jpg')
post.photos.attach(io: img, filename: "", content_type: "image/png")
post.save

random_user = User.where.not(id: User.first.id).order("RANDOM()").first

Comment.create!(content: "Wow! This is relaxing!", user: random_user, post: post)
Comment.create!(content: "Good stuff :) !", user: random_user, post: post)
Comment.create!(content: "Great exercise! I would also recommend to always do some prevention exercises 😊", user: a, post: post)

5.times do
  Tagging.create!(taggable_type: "Post", taggable_id: post.id, tag: Tag.all[0...49].sample)
end



#### post 2 yoga  kat
post = Post.new(
  title: "Unlock Your Inner Zen: 5 Yoga Poses for Ultimate Relaxation",
  content: "🌟 Unlock Your Inner Zen: 5 Yoga Poses for Ultimate Relaxation 🧘‍♂️✨

  Hey wellness community! Today, I’m excited to dive into the transformative power of yoga with you all. If you're looking to melt away stress and embrace deep relaxation, these five poses are your new best friends. 🕊️

  Child’s Pose (Balasana) - This gentle stretch calms the brain and helps relieve stress and fatigue. Perfect for a soothing start or finish to your practice. 🌼

  Cat-Cow (Marjaryasana-Bitilasana) - A wonderful pose to warm up the spine and relax the body. Flow between these poses to relieve tension in your back and neck. 🐈🐄

  Legs-Up-The-Wall Pose (Viparita Karani) - Ideal for easing anxiety and stress. This pose also helps with sleep issues by calming the nervous system. 🌙

  Seated Forward Bend (Paschimottanasana) - Deeply calming for the mind, this pose also stretches the spine and helps relieve the symptoms of menopause and menstrual discomfort. 🌾

  Corpse Pose (Savasana) - The ultimate relaxation pose. Spend a few minutes in Savasana at the end of your session to feel a profound sense of peace and rejuvenation. 💫

  Take a little time each day to practice these poses, and watch your stress levels drop while your inner peace blooms. Remember, a relaxed mind is a happy mind! 🌿",
  user: a)
img = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696334260/xeoh9bn2dq3runng1m4v.jpg')
post.photos.attach(io: img, filename: "", content_type: "image/png")
post.save

5.times do
  Tagging.create!(taggable_type: "Post", taggable_id: post.id, tag: Tag.all[0...49].sample)
end

### post 3 yoga kat ***
post = Post.new(
  title: "Backpain? You've got to try Yoga! 🤸‍♀️",
  content: "Hey wellness warriors! 🌿 Struggling with nagging back pain? I've been there, and I know how tough it can be. 🤕 That's why I want to share something that has completely transformed my approach to managing back discomfort—Yoga! 🌈

  I started incorporating simple yoga stretches into my daily routine, and the difference has been night and day. 🌞 Poses like Cat-Cow, Child's Pose, and Downward Facing Dog are not only soothing but help strengthen the muscles that support our spine. 🙌

  If you’re on the fence about it, I highly encourage you to give it a try—even just a few minutes a day can make a big impact! 🕊️ Remember, it's all about taking small steps towards a healthier, pain-free you. 💪 Let’s bend so we don't break!",
  user: a)
# img = File.open('/home/gonzalo/code/educhigon/ h4y/app/assets/images/yoga1.png', "rb")
img = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696334260/xeoh9bn2dq3runng1m4v.jpg')
post.photos.attach(io: img, filename: "", content_type: "image/png")
# img = File.open('/home/gonzalo/code/educhigon/ h4y/app/assets/images/yoga2.png', "rb")
img = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696334260/xeoh9bn2dq3runng1m4v.jpg')
post.photos.attach(io: img, filename: "", content_type: "image/png")
# img = File.open('/home/gonzalo/code/educhigon/ h4y/app/assets/images/yoga3.png', "rb")
img = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696334260/xeoh9bn2dq3runng1m4v.jpg')
post.photos.attach(io: img, filename: "", content_type: "image/png")
post.save

5.times do
  Tagging.create!(taggable_type: "Post", taggable_id: post.id, tag: Tag.all[0...49].sample)
end


#### posts post DS
post = Post.new(
  title: "Life After Achievement: Setting New Goals When the High Wears Off",
  content: "Hey everyone! Achieving big goals can give us an incredible high, leaving us feeling on top of the world... until the excitement fades. Ever find yourself asking, 'What's next?' Here's how to navigate that post-achievement phase and set new, meaningful goals. 🚀

  Reflect on Your Journey - Take some time to reflect on what you’ve accomplished. Understanding what you enjoyed (or didn’t) can guide your next steps. 🤔

  Seek New Inspirations - Look for new sources of inspiration. Whether it’s books, podcasts, or conversations with mentors, fresh ideas can spark new passions. 📚

  Set SMART Goals - Ensure your new goals are Specific, Measurable, Achievable, Relevant, and Time-bound. SMART goals can help you move forward with purpose. 🎯

  Embrace Learning - Consider picking up a new skill or deepening your knowledge in a different area. Learning keeps your brain engaged and opens up new possibilities. 🧠

  Focus on Personal Growth - Beyond career or external achievements, consider setting goals related to personal development like improving your health, learning a new hobby, or building stronger relationships. 💪

  Give Back - Sometimes, the most fulfilling goals involve giving back to the community. Find a cause you care about and see how you can contribute. 🌍

  Remember, life is a continuous journey of learning and growth. Each achievement is just a stepping stone to the next adventure. Here’s to your next chapter! 🥂",
  user: g)
img = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696334260/xeoh9bn2dq3runng1m4v.jpg')
post.photos.attach(io: img, filename: "", content_type: "image/png")
post.save

5.times do
  Tagging.create!(taggable_type: "Post", taggable_id: post.id, tag: Tag.all[0...10].sample)
end

post = Post.new(
  title: "5 ways to reinvigorate after an exhaustive project",
  content: "",
  user: c)
img = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696334260/xeoh9bn2dq3runng1m4v.jpg')
post.photos.attach(io: img, filename: "", content_type: "image/png")
post.save

5.times do
  Tagging.create!(taggable_type: "Post", taggable_id: post.id, tag: Tag.all[0...10].sample)
end

post = Post.new(
  title: "How to overcome post Bootcamp depression",
  content:
  "Step 1: Just move 🚶‍♂️
  Step 2: get some sun ☀
  Step 3: sleep well 👏👏",
  user: d)
# img = File.open('/home/gonzalo/code/educhigon/ h4y/app/assets/images/escobar2.png', "rb")
img = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696334260/xeoh9bn2dq3runng1m4v.jpg')
post.photos.attach(io: img, filename: "", content_type: "image/png")
# img = File.open('/home/gonzalo/code/educhigon/ h4y/app/assets/images/escobar1.png', "rb")
img = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696334260/xeoh9bn2dq3runng1m4v.jpg')
post.photos.attach(io: img, filename: "", content_type: "image/png")
# img = File.open('/home/gonzalo/code/educhigon/ h4y/app/assets/images/escobar3.png', "rb")
img = URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1696334260/xeoh9bn2dq3runng1m4v.jpg')
post.photos.attach(io: img, filename: "", content_type: "image/png")
post.save

5.times do
  Tagging.create!(taggable_type: "Post", taggable_id: post.id, tag: Tag.all[0...10].sample)
end

p "Creating Reviews"
rating = [-1, 1, 1, 1]
((User.all.count * Post.all.count * 0.8).floor).times do
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
p "Tags: #{Tag.count}"
p "Taggings: #{'🍌' * Tagging.count}"
p "Taggings: #{Tagging.count}"

p "Destroy Comment"
Comment.destroy_all
p "Destroy Favorite"
Favorite.destroy_all
p "Destroy Post"
Post.destroy_all
p "Destroy Profile"
Profile.destroy_all
p "Destroy Review"
Review.destroy_all
p "Destroy User"
User.destroy_all

# p "Creating users"
a = User.create!(email: "bobusa@gmail.com", password: "password")
b = User.create!(email: "lucas@lewagon.com", password: "password")
c = User.create!(email: "emma@test.com", password: "123456")
d = User.create!(email: "iratxe@lewagon.com", password: "password")
p "Users created"

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

p "Creating Profiles"
User.all.each do |user|
  # Profile.create!(user: user, name: user.email.split('@')[0], bio: ('a'..'z').to_a.sample(50).join).profile_picture.attach(io: blob, filename: "H4you.png", content_type: "image/png" )
  Profile.create!(user: user, name: user.email.split('@')[0], bio: ('a'..'z').to_a.sample(50).join)
  HealthDatum.create!(
    occupation: "Houseman",
    gender: "Male",
    country: "Germany",
    sleeping_hours: 1,
    age: 30,
    weight: 70,
    height: 1.9,
    bmi: 24,
    sun_exposure: 1,
    self_employed: false,
    smoker: true,
    alcohol_consumer: true,
    active: true,
    dairy_intake: 1,
    user: user
  )
end

# p "Database contains:"
# p "Users: #{User.count}"
# p "Posts: #{Post.count}"
# p "Comments: #{Comment.count}"
# p "Reviews: #{Review.count}"
# p "Favorites: #{Favorite.count}"
# p "Profiles: #{Profile.count}"
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

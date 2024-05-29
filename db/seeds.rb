Comment.destroy_all
Favorite.destroy_all
Post.destroy_all
Profile.destroy_all
Review.destroy_all
User.destroy_all

# p "Creating users"
a = User.create!(email: "bobusa@gmail.com", password: "password")
b = User.create!(email: "lucas@lewagon.com", password: "password")
c = User.create!(email: "emma@test.com", password: "123456")
d = User.create!(email: "iratxe@lewagon.com", password: "password")

# p "Creating posts"
test_post = Post.create!(title: "Apples good", content: "An apple a day keeps the doctor away", user: b)
Post.create!(title: "Just move LOL", content: "🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️🚶‍♀️gehen", user: c)
Post.create!(title: "Coffee bad :(", content: "Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc ", user: a)
Post.create!(title: "Potato good", content: "Potatos are like apples", user: b)

# p "Creating Comments"
Comment.create!(content: "Good stuff :) !", user: a, post: test_post)
Comment.create!(content: "WEAK POST! I could do better", user: d, post: test_post)
Comment.create!(content: "I just throw apples at homeless children 😎", user: c, post: test_post)
posts = Post.all.to_a - [test_post]
posts.each do |post|
  5.times do
    Comment.create!(content: ('a'..'z').to_a.sample(26).join, user: User.all.sample, post: post)
  end
end

# p "Creating Reviews"
xx = User.all.count * Post.all.count + 10
rating = [0, 1]
xx.times do
  Review.create!(rating: rating.sample, post: Post.all.sample, user: User.all.sample)
end

# p "Creating Favorites"
xx.times do
  Favorite.create!(post: Post.all.sample, user: User.all.sample)
end

# p "Creating Profiles"
User.all.each do |user|
  Profile.create!(user: user, name: user.email.split('@')[0], bio: ('a'..'z').to_a.sample(50).join)
end

# p "Database contains:"
# p "Users: #{User.count}"
# p "Posts: #{Post.count}"
# p "Comments: #{Comment.count}"
# p "Reviews: #{Review.count}"
# p "Favorites: #{Favorite.count}"
# p "Profiles: #{Profile.count}"

p "Database contains:"
p "Users: #{'🍌' * User.count}"
p "Posts: #{'🍌' * Post.count}"
p "Comments: #{'🍌' * Comment.count}"
p "Reviews: #{'🍌' * Review.count}"
p "Favorites: #{'🍌' * Favorite.count}"
p "Profiles: #{'🍌' * Profile.count}"

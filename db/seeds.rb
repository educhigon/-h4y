Comment.destroy_all
Favorite.destroy_all
Post.destroy_all
Profile.destroy_all
Review.destroy_all
User.destroy_all

a = User.create!(email: "bobusa@gmail.com", password: "password")
b = User.create!(email: "lucas@lewagon.com", password: "password")
c = User.create!(email: "emma@lewagon.com", password: "password")
d = User.create!(email: "iratxe@lewagon.com", password: "password")

users = [a, b, c, d]

q = Post.create!(title: "Apples good", content: "An apple a day keeps the doctor away", user_id: b.id)
w = Post.create!(title: "Just move LOL", content: "🚶‍♀️", user_id: c.id)
e = Post.create!(title: "Coffee bad :(", content: "Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc ", user_id: a.id)
r = Post.create!(title: "Potato good", content: "Potatos are like apples", user_id: b.id)

posts = [q, w, e, r]

Comment.create!(content: "good stuff :)!", user: users.sample, post: posts.sample)
Comment.create!(content: "I just throw apples at homeless children 😎", user: users.sample, post: q)

Review.create!(rating: 3, post: q)
Review.create!(rating: 4, post: q)
Review.create!(rating: 1, post: r)

Favorite.create!(post: q, user: b)
Favorite.create!(post: w, user: b)
Favorite.create!(post: q, user: d)

Profile.create!(user: a, name: "Bob", bio: "qweqweasdasd")
Profile.create!(user: b, name: "Lucas", bio: "yxcxycyxcasdasd")

p "Database contains:"
p "Users: #{User.count}"
p "Posts: #{Post.count}"
p "Comments: #{Comment.count}"
p "Reviews: #{Review.count}"
p "Favorites: #{Favorite.count}"
p "Profiles: #{Profile.count}"

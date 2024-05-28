Comment.destroy_all
Favorite.destroy_all
Post.destroy_all
Profile.destroy_all
Review.destroy_all
User.destroy_all

p "Creating users"
a = User.create!(email: "bobusa@gmail.com", password: "password")
b = User.create!(email: "lucas@lewagon.com", password: "password")
c = User.create!(email: "emma@test.com", password: "123456")
d = User.create!(email: "iratxe@lewagon.com", password: "password")

p "Creating posts"
q = Post.create!(title: "Apples good", content: "An apple a day keeps the doctor away", user: b)
w = Post.create!(title: "Just move LOL", content: "🚶‍♀️", user: c)
e = Post.create!(title: "Coffee bad :(", content: "Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc Long text etc ", user: a)
r = Post.create!(title: "Potato good", content: "Potatos are like apples", user: b)

posts = [q, w, e, r]

p "Creating Comments"
Comment.create!(content: "g ood stuff :)!", user: User.all.sample, post: posts.sample)
Comment.create!(content: "I just throw apples at homeless children 😎", user: User.all.sample, post: q)

p "Creating Reviews"
Review.create!(rating: 3, post: q, user: User.all.sample )
Review.create!(rating: 4, post: q, user: User.all.sample )
Review.create!(rating: 1, post: r, user: User.all.sample )

p "Creating Favorite"
Favorite.create!(post: q, user: User.all.sample )
Favorite.create!(post: w, user: User.all.sample )
Favorite.create!(post: q, user: User.all.sample )

p "Creating Profile"
Profile.create!(user: a, name: "Bob", bio: "qweqweasdasd")
Profile.create!(user: b, name: "Lucas", bio: "yxcxycyxcasdasd")

p "Database contains:"
p "Users: #{User.count}"
p "Posts: #{Post.count}"
p "Comments: #{Comment.count}"
p "Reviews: #{Review.count}"
p "Favorites: #{Favorite.count}"
p "Profiles: #{Profile.count}"

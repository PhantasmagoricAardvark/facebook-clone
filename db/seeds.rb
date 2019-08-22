# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = ["seba","ada","greg","bob"]
i = 0
while i < 4
	User.create(username: "#{users[i]}", email:"#{users[i]}@foo.com", password: "foobar")
	i += 1
end

post_title = ["Hey guys!", "First post!"]
post_content = ["How is everyone?", "Like my post if you ate cereal today!! Pls!!"]
user_ids = [1,2]
i = 0
while i < 2
	Post.create(title: post_title[i] , content: post_content[i] , user_id: user_ids[i] )
	i += 1
end

Friendship.create(user_id: 1, friend_id: 2)
Friendship.create(user_id: 2, friend_id: 1)
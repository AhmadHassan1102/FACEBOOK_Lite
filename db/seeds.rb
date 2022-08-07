# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: "123@gmail.com", password: "1234")
p1 = User.first.posts.create(data: "First Post")
p2 = User.first.posts.create(data: "Second Post")
User.first.reactions.create(data: "Like",post_id: p1.id)
User.first.reactions.create(data: "Heart",post_id: p2.id)
User.first.comments.create(data: "Nice Post",post_id: p1.id)
User.first.comments.create(data: "Nice Post",post_id: p2.id)
User.first.comments.create(data: "OYEOYEOYEOYE....!",post_id: p2.id)

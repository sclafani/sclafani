require "faker"

user = User.new(username: Faker::Internet.user_name, email: Faker::Internet.email)

user.save
10.times do
  post = Post.new(
    name: Faker::Pokemon.name,
    url: Faker::Internet.url,
    votes: rand(0..1000)
  )
  post.user = user
  post.save!

  # Add seed comments
  rand(0..10).times do
    Comment.create(content: Faker::Hipster.sentence, post: post)
  end
end

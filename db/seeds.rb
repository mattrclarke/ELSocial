user = User.create(email: "foo@bar.com", password: 'password')
profile = Profile.create(user_id: user.id, first_name: "Matt", last_name: "Clarke")
feed = Feed.create(profile_id: profile.id, user_id: user.id)

50.times do |index|
  user = User.create(email: Faker::Internet.email, password: 'password')
  profile = Profile.create(user_id: user.id, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  feed = Feed.create(profile_id: profile.id, user_id: user.id)

  5.times do
    Post.create(
      title: Faker::Music.band,
      content: Faker::Music.genre,
      feed_id: feed.id,
      user_id: user.id
    )
  end

end

# users = User.all
# user  = users.first
# following = users[2..50]
# followers = users[3..40]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }

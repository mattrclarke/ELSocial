test_user = User.create(email: "foo@bar.com", password: 'password')
profile = Profile.create(
  user_id: test_user.id,
  first_name: "Matt",
  last_name: "Clarke",
  about_me: Faker::Lorem.paragraph(sentence_count: 15)

)
feed = Feed.create(profile_id: profile.id, user_id: test_user.id)

50.times do |index|
  user = User.create(email: Faker::Internet.email, password: 'password')
  profile = Profile.create(
    user_id: user.id,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    about_me: Faker::Lorem.paragraph(sentence_count: [0..10].sample)
    )

  feed = Feed.create(profile_id: profile.id, user_id: user.id)

  user.follow(test_user)


  5.times do
    Post.create(
      title: Faker::Music.band,
      content: Faker::Lorem.paragraph,
      feed_id: feed.id,
      user_id: user.id
    )
  end

end

users = User.all
user  = users.first

# Commented to better demonstrate subscriptions
# following = users[2..50]
# following.each { |followed| user.follow(followed) }

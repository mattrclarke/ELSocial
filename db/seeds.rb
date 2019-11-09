test_user = User.create(email: "a@a.com", password: 'a')

lat = 0.000
lon = 0.000
5.times do |x|
  lat = lat + 0.001
  lon = lon + 0.001
  lease = Lease.create(location: "BC3#{x}", latitude: -25.340 + lat, longitude: 131.030 + lon)
  pen = Pen.create(lease: lease, name: "Lorem#{x}")
  # LeasePen.create(lease:lease, pen:pen)
end

lease = Lease.first
pen = Pen.first

7.times do |x|
  5.times do |y|
    MortalityForm.create(lease: lease, pen: pen,
     date: DateTime.current - x.days,
     bird_strikes: Random.rand(50),
     seal_strikes: Random.rand(50),
     skinny: Random.rand(50),
     deformities: Random.rand(50),
     unknown: Random.rand(50),
     mort_comments: Random.rand(50),
     shallow_rot: Random.rand(50),
     deep_rot: Random.rand(50),
     missing_weights: Random.rand(50),
     skin_burn: Random.rand(50),
     fish_rub: Random.rand(50),
     probe_cleaned: Random.rand(1),
     observations: Random.rand(50)
    )
  end
end


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

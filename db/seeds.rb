user = User.create(email: "a@a.com", password: 'a')
profile = Profile.create(user_id: user.id, first_name: "Matt", last_name: "Clarke")
feed = Feed.create(profile_id: profile.id, user_id: user.id)

10.times do
  user = User.create(email: Faker::Internet.email, password: 'password')
  profile = Profile.create(user_id: user.id, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  feed = Feed.create(profile_id: profile.id, user_id: user.id)
end
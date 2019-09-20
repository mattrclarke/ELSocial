user = User.create(email: "a@a.com", password: 'a')
profile = Profile.create(user_id: user.id, first_name: "Matt", last_name: "Clarke")
feed = Feed.create(profile_id: profile.id, user_id: user.id)

user = User.create(email: "x@x.com", password: 'x')
profile = Profile.create(user_id: user.id, first_name: "Tim", last_name: "Thompson")
feed = Feed.create(profile_id: profile.id, user_id: user.id)

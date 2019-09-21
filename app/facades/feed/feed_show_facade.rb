class Feed::FeedShowFacade

  def feed_subscribers
    @subscriptions = current_user.followers.map(&:id)
    @subscriptions << current_user.id
  end

  def posts
    @posts = User.find_by_sql(["select users.id, profiles.first_name,
    profiles.last_name, posts.title, posts.content
    from users
    inner join profiles on users.id = profiles.user_id
    inner join posts on users.id = posts.user_id
    where profiles.user_id in (?)
    order by posts.created_at desc;", subscriptions])
  end

end

class FeedController < ApplicationController
  def show

    subscriptions = current_user.followers.map(&:id)
    subscriptions << current_user.id

    # Other solutions could be to add a name column to posts,
    # or where().includes along the relationships and map out the results into
    # a hash or view model array
    @posts = User.find_by_sql(["select users.id, profiles.first_name,
    profiles.last_name, posts.title, posts.content from users
    inner join profiles on users.id = profiles.user_id
    inner join posts on users.id = posts.user_id
    where profiles.user_id in (?)
    order by posts.created_at desc;", subscriptions])

  end
end

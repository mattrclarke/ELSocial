class FeedController < ApplicationController
  def show
    @post = Post.new

    @posts = FeedPostFetcher.new(current_user: current_user).run


    # Another solution
    # @posts = User.find_by_sql(["select users.id, profiles.first_name,
    # profiles.last_name, posts.title, posts.content, posts.image from users
    # inner join profiles on users.id = profiles.user_id
    # inner join posts on users.id = posts.user_id
    # where profiles.user_id in (?)
    # order by posts.created_at desc;", subscriptions])

  end
end

class PostsController < ApplicationController
  def create
    profile = Profile.find_by(user_id: current_user.id)
    feed = Feed.find_by(profile_id: profile.id)

      Post.create(
        title: params[:title],
        content: params[:content],
        user_id: current_user.id,
        feed_id: feed.id,
      )
  end
end

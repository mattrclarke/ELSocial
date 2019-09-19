class PostsController < ApplicationController
  def create
    profile = Profile.find_by(user_id: current_user.id)
    feed = Feed.find_by(profile_id: profile.id)
    byebug
      Post.create(
        title: params[:post][:title],
        content: params[:post][:content],
        user_id: current_user.id,
        feed_id: feed.id,
      )
  end
end

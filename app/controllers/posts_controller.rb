class PostsController < ApplicationController
  def create
    profile = Profile.find_by(user_id: current_user.id)

      Post.create(
        title: params[:title],
        content: params[:content],
        user_id: current_user.id,
        feed_id: params[:feed_id],
      )
      @posts = Post.where(feed_id: params[:feed_id]).order('id DESC')
      
  end
end

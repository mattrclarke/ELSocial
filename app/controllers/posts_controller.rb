class PostsController < ApplicationController
  def create

      post = Post.create(
        title: params[:post][:title],
        content: params[:post][:content],
        image: params[:post][:image],
        user_id: params[:user_id],
        feed_id: params[:feed_id]
      )

      redirect_to user_feed_path(id: params[:feed_id])
      # @posts = Post.where(feed_id: params[:feed_id]).order('id DESC')

  end
end

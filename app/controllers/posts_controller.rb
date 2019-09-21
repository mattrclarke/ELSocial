class PostsController < ApplicationController
  def create
      Post.create(
        title: params[:title],
        content: params[:content],
        user_id: params[:user_id],
        feed_id: params[:feed_id],
      )

      @posts = Post.where(feed_id: params[:feed_id]).order('id DESC')

  end
end

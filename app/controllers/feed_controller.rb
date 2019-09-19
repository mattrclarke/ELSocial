class FeedController < ApplicationController
  def show
    byebug
    @posts = Post.where(feed_id: params[:id])
  end
end

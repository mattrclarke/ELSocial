class FeedController < ApplicationController
  def show
    @posts = Post.where(feed_id: params[:id]).order('id DESC')
  end
end

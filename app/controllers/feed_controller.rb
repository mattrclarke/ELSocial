class FeedController < ApplicationController
  def show
    @post = Post.new
    @posts = FeedPostFetcher.new(current_user: current_user).run
  end
end

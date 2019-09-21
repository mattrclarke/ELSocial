class FeedsController < ApplicationController
  def show
    @feed = Feed.find(params[:id])
    @facade = FeedShowFacade.new(feed: feed)
  end
end

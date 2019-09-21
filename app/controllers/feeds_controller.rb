class FeedsController < ApplicationController
  def show
    @facade = FeedShowFacade.new(feed: feed)
  end
end

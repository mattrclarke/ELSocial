class FeedShowFacade

  def initialize(feed:)
    @feed = feed
  end

  def posts
      @posts ||= Post.where(feed_id: @feed.id).order('id DESC')
  end
  
end

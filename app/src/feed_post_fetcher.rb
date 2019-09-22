class FeedPostFetcher

  def initialize(current_user:)
    @current_user = current_user
  end

  def run
    @all_subscribers ||= @current_user.following.map(&:id)
    @all_subscribers << @current_user.id

    users = User.where(id: @all_subscribers).includes(:profile)
    posts = Post.where(user_id: @all_subscribers).reverse
    profiles = users.map{ |user| user.profile }
    @all_posts = posts.map do |post|
      profile = profiles.find{ |x| x.user_id == post.user_id }
      {
        first_name: profile.first_name,
        last_name: profile.last_name,
        title: post.title,
        content: post.content,
        image: post.image_url
      }
     end

  end
end

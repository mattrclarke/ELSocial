class FeedPostFetcher

  def initialize(current_user:)
    @current_user = current_user
  end

  def run
     users = User.where(id: all_subscribers).includes(:profile)
     posts = Post.where(user_id: all_subscribers).reverse
     profiles = users.map{ |user| user.profile }

     @all_posts = posts.map do |post|
       profile = profiles.find{ |x| x.user_id == post.user_id }
      {
         first_name: profile.first_name,
         last_name: profile.first_name,
         title: post.title,
         content: post.content,
         image: post.image_url
       }
     end

  end

  def all_subscribers
      @all_subscribers ||= @current_user.followers.map(&:id)
      @all_subscribers << @current_user.id
    end

end

#
# class FeedPostFetcher
#
#   def initialze(user_id:)
#     @user_id = user_id
#   end
#
#   def all_subscribers
#     @subscriptions ||= current_user.followers.map(&:id)
#     @all_subscribers << current_user.id
#   end
#
#   def run
#     users = User.where(id: subscriptions).includes(:profile)
#     posts = Post.where(user_id: subscriptions)
#     profiles = users.map{ |user| user.profile }
#
#     @all_posts = posts.map do |post|
#       profile = profiles.find{ |x| x.user_id == post.user_id }
#      {
#         first_name: profile.first_name,
#         last_name: profile.first_name,
#         title: post.title,
#         content: post.content,
#         image: post.image_url
#       }
#     end
#   end
#
# end

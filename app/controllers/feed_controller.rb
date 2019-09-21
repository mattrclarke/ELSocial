class FeedController < ApplicationController
  def show
    posts = Post.where(feed_id: params[:id]).order('id DESC')

    subscriptions = current_user.followers.map(&:id)
    subscriptions << current_user.id
    
    # Other solutions could be to add a name column to posts,
    # or where().includes along the relationships and map out the results into
    # a hash or view model array
    @posts = User.find_by_sql(["select users.id, profiles.first_name,
    profiles.last_name, posts.title, posts.content
    from users
    inner join profiles on users.id = profiles.user_id
    inner join posts on users.id = posts.user_id
    where profiles.user_id in (?)
    order by posts.created_at desc;", subscriptions])

  end
end





    # subscriptions = current_user.followers.map(&:id)
    # subscriptions << current_user.id
    #
    # @posts ||= Post.where(user_id: subscriptions)
    # byebug
    # @all_posts = @posts || []









# return @all_posts if followers.nil?
# byebug
#
# @posts ||= User.where(id: followers)
# .includes(:profile)
# .includes(:posts)
# .order(:created_at)
#
# @all_posts = @posts.map do |x|
#   if x.posts.present?
#    posts = x.posts.map do |post|
#      {
#       first_name: x.profile[:first_name],
#       last_name: x.profile[:last_name],
#       title: post[:title],
#       content: post[:content],
#       created: post[:created_at]
#      }
#    end
#   end
#  end
# @all_posts.flatten!

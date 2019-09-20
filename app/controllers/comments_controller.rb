class CommentsController < ApplicationController
  def create
    p 'working'
    Comment.create(
      content: params[:content],
      profile_id: params[:profile_id]
    )
    byebug
  end
end
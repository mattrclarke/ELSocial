class CommentsController < ApplicationController
  def create
    Comment.create(
      content: params[:content],
      profile_id: params[:profile_id]
    )
  end
end

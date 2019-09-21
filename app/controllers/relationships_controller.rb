class RelationshipsController < ApplicationController
  def create
     @other_user = User.find(params[:followed_id])
     current_user.follow(@other_user)
     profile = Profile.find_by(user_id: @other_user.id)
     # redirect_to user_profile_path(user_id: user.id, id: profile.id)
   end

   def destroy
     @other_user = Relationship.find(params[:id]).followed
     profile = Profile.find_by(user_id: @other_user.id)
     current_user.unfollow(@other_user)
     # redirect_to user_profile_path(user_id: user.id, id: profile.id)
   end
 end

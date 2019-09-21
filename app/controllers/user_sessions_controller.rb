class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    # redirect_back_or_to(dashboard_path) if logged_in?
    redirect_to user_profile_path(user_id: current_user.id ,id: current_user.profile.id) if logged_in?
  end

  def create
    @user = login(params[:email].downcase, params[:password])
    return failed_login unless @user
    profile = Profile.find_by(user_id: @user.id)
    feed = Feed.find_by(profile_id: profile.id)
    redirect_to user_profile_path(user_id: current_user.id, id: current_user.profile.id)
  end

  def destroy
    logout
    flash[:warning] = "Logged out!"
    redirect_to new_user_sessions_path
  end

  def failed_login
    @failed_login = true
    render action: 'new'
  end
end

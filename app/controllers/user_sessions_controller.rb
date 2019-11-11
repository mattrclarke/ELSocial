class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    redirect_to user_profile_path(user_id: current_user.id ,id: current_user.profile.id) if logged_in?
  end

  def create
    @user = login(params[:email].downcase, params[:password])
    return failed_login unless @user
    redirect_to leases_path
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

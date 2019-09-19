class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    redirect_to success_user_sessions_path if logged_in?
    # redirect_back_or_to(dashboard_path) if logged_in?
  end

  def success

  end

  def create
    @user = login(params[:email].downcase, params[:password])
    return failed_login unless @user
    redirect_to profile_path(@user.profile)
    # redirect_back_or_to(dashboard_path)
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

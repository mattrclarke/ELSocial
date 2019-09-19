class UsersController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new

  end

  def create
    existing_user = User.find_by(email: params[:email])
    if existing_user.nil?
      user = Users::UserCreateFacade.new(
      email: params[:email],
      password: params[:password],
      first_name: params[:first_name],
      last_name: params[:last_name],
      ).run

      flash[:success] = "Account for #{user.email} successfully created"
      redirect_to user_sessions_path
    else
      redirect_to new_user_sessions_path
      flash[:danger] = "Account for #{existing_user.email} already exists"
    end

  end



end

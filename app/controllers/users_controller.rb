class UsersController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
  end

  def create
    user = Users::UserCreateFacade.new(
      email: params[:email],
      password: params[:password],
      first_name: params[:first_name],
      last_name: params[:last_name],
    ).run

    flash[:success] = "Account for #{user.email} successfully created"
    redirect_to user_sessions_path

    rescue Users::UserCreateFacade::UserAlreadyExists
      flash[:danger] = "Account for email already exists"
      redirect_to new_user_sessions_path
  end
end

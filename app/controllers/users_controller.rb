class UsersController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new

  end

  def create
    existing = User.where(email: params[:email])
    unless existing.present?
        user = User.create(
        email: params[:email],
        password: params[:password]
      )

      Profile.create(
        user_id: user.id,
        first_name: params[:first_name],
        last_name: params[:last_name]
      )
      flash[:success] = "Account for #{user.email} successfully created"
      redirect_to user_sessions_path
    end

  end



end

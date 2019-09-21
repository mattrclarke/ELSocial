class ProfileController < ApplicationController

  def show
    @profile = profile
    @other_user = User.find(@profile.user_id)
  end

  def edit
    @profile = profile
  end

  def index
    if params[:query].present?
      @all_profiles ||= ProfileSearcher.new(
        query: params[:query]
      ).run
    else
      @all_profiles = Profile.all
    end
  end

  def update
    profile = Profile.find(params[:id])
    profile.update(
      first_name: profile_params[:first_name],
      last_name: profile_params[:last_name],
      about_me: profile_params[:about_me]
    )
    byebug
    profile.avatar.attach(profile_params[:avatar])

  end

  def search
    @facade = Profiles::ProfileIndexFacade.new(query: params[:query]).run
  end

  private
  def profile_params
      params.permit(:first_name, :last_name, :about_me, :avatar)
    end
  def profile
    @profile = Profile.find(params[:id])
  end
end

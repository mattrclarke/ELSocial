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
    profile.update!(profile_params)

  end

  def search
    @facade = Profiles::ProfileIndexFacade.new(query: params[:query]).run
  end

  private
  def profile_params
    byebug
      params.require(:profile).permit(:first_name, :last_name, :about_me, :image)
    end
  def profile
    @profile = Profile.find(params[:id])
  end
end

class ProfileController < ApplicationController

  def show
    @profile = profile
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
    @profile = profile
    profile.update(
      first_name: params[:profile][:first_name],
      last_name: params[:profile][:last_name]
    )
  end
  
  def search
    @facade = Profiles::ProfileIndexFacade.new(query: params[:query]).run
  end

  private

  def profile
    @profile = Profile.find(params[:id])
  end
end

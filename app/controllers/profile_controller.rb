class ProfileController < ApplicationController

  def show
    @profile = profile
  end

  def edit
    @profile = profile
  end

  def update
    @profile = profile
    profile.update(
      first_name: params[:profile][:first_name],
      last_name: params[:profile][:last_name]
    )
  end

  private

  def profile
    @profile = Profile.find(params[:id])
  end
end

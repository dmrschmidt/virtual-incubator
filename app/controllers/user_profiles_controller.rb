class UserProfilesController < ApplicationController
  before_action :set_profile

  def show
  end

  def edit
  end

  def new
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_profile
      @profile = UserProfile.where(user: current_user).first || UserProfile.new
    end

    def profile_params
      params.require(:user_profile).permit(:job_title, :location, languages_spoken: [])
    end
end

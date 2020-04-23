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
      @profile = UserProfile.where(user: current_user).first
    end

    def profile_params
      params.require(:user_profile).permit(:job_title, :location,
        :venture_description, :social_url_linkedin, :company_website_url,
        :venture_founded, :company_name, :team_size, :industry,
        :profile_description, :mentor_how_can_i_help, :mentor_expertise,
        :skills_csv,
        operating_countries: [], languages_spoken: [])
    end
end

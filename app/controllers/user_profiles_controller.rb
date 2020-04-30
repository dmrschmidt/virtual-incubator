class UserProfilesController < ApplicationController
  load_and_authorize_resource

  def show; end

  def edit; end

  def new; end

  def update
    respond_to do |format|
      if @user_profile.update(profile_params)
        format.html { redirect_to @user_profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_profile }
      else
        format.html { render :edit }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def profile_params
    params.require(:user_profile).permit(:job_title, :location,
      :venture_description, :social_url_linkedin, :company_website_url,
      :venture_founded, :company_name, :team_size, :industry,
      :profile_description, :mentor_how_can_i_help, :mentor_expertise,
      :skills_csv, :team_description, :venture_stage, :sdg_goal,
      :meeting_schedule_url,
      operating_countries: [], languages_spoken: [])
  end
end

class UserProfilesController < ApplicationController
  def show
    @profile = UserProfile.where(user: current_user).first || UserProfile.new
  end

  def edit
    @profile = UserProfile.where(user: current_user).first || UserProfile.new
  end

  def new
    @profile = UserProfile.where(user: current_user).first || UserProfile.new
  end

  def update
    @profile = UserProfile.where(user: current_user).first || UserProfile.new
  end
end

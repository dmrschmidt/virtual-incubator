class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super.tap do
      @user.user_profile = UserProfile.new
      @user.save
    end
  end

  def update
    super
  end
end

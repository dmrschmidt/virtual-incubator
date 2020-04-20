class UserProfile < ApplicationRecord
  belongs_to :user

  def email
    user.email
  end
end

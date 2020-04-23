class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  validates_presence_of :title, :current_challenges, :actions_taken, :skills_needed

  def skills_needed_csv=(value)
    self.skills_needed = value.split(',').map(&:strip)
  end

  def skills_needed_csv
    skills_needed&.join(', ')
  end

  def tags
    [
      UserProfile.venture_stages[user.user_profile.venture_stage],
      ISO3166::Country.find_country_by_alpha2(user.user_profile.location)&.translation('en'),
      UserProfile.industries[user.user_profile.industry],
      UserProfile.sdg_goals[user.user_profile.sdg_goal]
    ].compact
  end
end

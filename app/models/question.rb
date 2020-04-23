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
      user.user_profile.venture_stage,
      user.user_profile.location,
      user.user_profile.industry,
      user.user_profile.sdg_goal
    ].compact
  end
end

class UserProfile < ApplicationRecord
  belongs_to :user
  delegate :email, to: :user

  def self.team_sizes
    [
      ['1', 'myself only'],
      ['1-5', '1 - 5 people'],
      ['5-10', '5 - 10 people'],
      ['10-50', '10 - 50 people'],
      ['50-100', '50 - 100 people'],
      ['100-250', '100 - 250 people'],
      ['250-500', '250 - 500 people'],
      ['500-1000', '500 - 1000 people'],
      ['1000+', '1000+ people'],
    ]
  end
end

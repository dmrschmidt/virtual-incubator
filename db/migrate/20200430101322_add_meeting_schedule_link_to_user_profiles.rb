class AddMeetingScheduleLinkToUserProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :user_profiles, :meeting_schedule_url, :string
  end
end

class AddMoreUserProfileFields < ActiveRecord::Migration[6.0]
  def change
    add_column :user_profiles, :team_description, :text
    add_column :user_profiles, :venture_stage, :string
    add_column :user_profiles, :sdg_goal, :string
  end
end

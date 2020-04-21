class AddMentorFieldsToUserProfile < ActiveRecord::Migration[6.0]
  def change
    rename_column :user_profiles, :website_url, :company_website_url
    rename_column :user_profiles, :venture_name, :company_name

    add_column :user_profiles, :profile_description, :text
    add_column :user_profiles, :mentor_expertise, :text
    add_column :user_profiles, :mentor_how_can_i_help, :text
    add_column :user_profiles, :industry, :string
    add_column :user_profiles, :skills, :string, array: true
  end
end

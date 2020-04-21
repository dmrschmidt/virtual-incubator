class AddAdvancedProfileFields < ActiveRecord::Migration[6.0]
  def change
    add_column :user_profiles, :social_url_linkedin, :string
    add_column :user_profiles, :website_url, :string
    add_column :user_profiles, :venture_name, :string
    add_column :user_profiles, :venture_founded, :string
    add_column :user_profiles, :venture_description, :text
    add_column :user_profiles, :team_size, :string
    add_column :user_profiles, :operating_countries, :string, array: true

    add_index :user_profiles, :operating_countries, using: 'gin'
  end
end

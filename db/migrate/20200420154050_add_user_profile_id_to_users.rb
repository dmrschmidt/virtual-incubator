class AddUserProfileIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_profile_id, :integer
    add_foreign_key :users, :user_profiles
  end
end

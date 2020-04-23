class RemoveUserProfileIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :user_profile_id
  end
end

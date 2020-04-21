class AddBasicFieldsToUserProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :user_profiles, :location, :string
    add_column :user_profiles, :languages_spoken, :string, array: true

    add_index :user_profiles, :languages_spoken, using: 'gin'
  end
end

class CreateUserProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :user_profiles do |t|
      t.integer :user_id
      t.string :job_title

      t.timestamps
    end
  end
end

class CreateUserProfilesIndustries < ActiveRecord::Migration
  def change
    create_table :user_profiles_industries do |t|
      t.integer :user_profile_id
      t.integer :industry_id

      t.timestamps
    end
  end
end

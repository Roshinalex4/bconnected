class CreateUserProfileSkills < ActiveRecord::Migration
  def change
    create_table :user_profile_skills do |t|
      t.integer :user_profile_id
      t.integer :skill_id

      t.timestamps
    end
  end
end

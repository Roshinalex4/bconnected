class CreateUserProfileLanguages < ActiveRecord::Migration
  def change
    create_table :user_profile_languages do |t|
      t.integer :user_profile_id
      t.integer :language_id

      t.timestamps
    end
  end
end

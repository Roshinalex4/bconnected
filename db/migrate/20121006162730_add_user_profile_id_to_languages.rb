class AddUserProfileIdToLanguages < ActiveRecord::Migration
  def change
    add_column :languages, :user_profile_id, :integer
  end
end

class AddDescriptionToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :description, :text
  end
end

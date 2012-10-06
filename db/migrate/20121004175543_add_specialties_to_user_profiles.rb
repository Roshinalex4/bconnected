class AddSpecialtiesToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :specialties, :text
  end
end

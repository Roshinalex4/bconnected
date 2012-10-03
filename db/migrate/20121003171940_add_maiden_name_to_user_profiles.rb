class AddMaidenNameToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :maiden_name, :string
  end
end

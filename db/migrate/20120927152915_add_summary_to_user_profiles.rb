class AddSummaryToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :summary, :text
  end
end

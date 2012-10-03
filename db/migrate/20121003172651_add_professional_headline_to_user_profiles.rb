class AddProfessionalHeadlineToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :professional_headline, :string
  end
end

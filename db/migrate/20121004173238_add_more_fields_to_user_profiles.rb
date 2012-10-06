class AddMoreFieldsToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :phone_number, :string
    add_column :user_profiles, :phone_type, :string
    add_column :user_profiles, :im, :string
    add_column :user_profiles, :im_service, :string
    add_column :user_profiles, :address, :text
    add_column :user_profiles, :birth_day, :integer
    add_column :user_profiles, :birth_month, :integer
    add_column :user_profiles, :birth_year, :integer
    add_column :user_profiles, :website_1, :string
    add_column :user_profiles, :website_1_type, :string
    add_column :user_profiles, :website_2, :string
    add_column :user_profiles, :website_2_type, :string
    add_column :user_profiles, :website_3, :string
    add_column :user_profiles, :website_3_type, :string
    add_column :user_profiles, :interests, :text
    add_column :user_profiles, :groups_associations, :text
    add_column :user_profiles, :honours_awards, :text
    remove_column :user_profiles, :birthday
    remove_column :user_profiles, :address_line_1
    remove_column :user_profiles, :address_line_2
  end
end

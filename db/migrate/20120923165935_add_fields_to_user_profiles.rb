class AddFieldsToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :address_line_1, :string
    add_column :user_profiles, :address_line_2, :string
    add_column :user_profiles, :state, :string
    add_column :user_profiles, :city, :string
    add_column :user_profiles, :birthday, :date
    add_column :user_profiles, :marital_status, :string
  end
end

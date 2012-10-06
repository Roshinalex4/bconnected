class AddProfilePictureToUserProfiles < ActiveRecord::Migration
  def change
    add_column :user_profiles, :picture_file_name, :string
    add_column :user_profiles, :picture_content_type, :string
    add_column :user_profiles, :picture_file_size, :integer
    add_column :user_profiles, :picture_updated_at, :datetime
  end
end

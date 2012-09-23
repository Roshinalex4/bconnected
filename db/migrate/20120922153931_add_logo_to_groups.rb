class AddLogoToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :logo_file_name, :string
    add_column :groups, :logo_content_type, :string
    add_column :groups, :logo_file_size, :integer
    add_column :groups, :logo_updated_at, :datetime
  end
end

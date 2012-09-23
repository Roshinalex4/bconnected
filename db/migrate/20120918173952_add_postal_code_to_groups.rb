class AddPostalCodeToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :postal_code, :string
  end
end

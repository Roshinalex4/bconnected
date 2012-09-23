class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :group_name
      t.integer :creator
      t.text :description
      t.string :group_type
      t.text :summary
      t.string :website
      t.string :group_owner_email
      t.integer :access
      t.boolean :display_in_directory
      t.boolean :allow_display_logo
      t.boolean :allo_invite_others
      t.string :language
      t.boolean :single_location
      t.integer :country_id
      t.boolean :check_agreement

      t.timestamps
    end
  end
end

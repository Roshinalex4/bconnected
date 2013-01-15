class CreateProfileViewLogs < ActiveRecord::Migration
  def up
    create_table :profile_view_logs do |t|
      t.integer :viewed_profile_of
      t.integer :viewed_by
    end
  end

  def down
  end
end

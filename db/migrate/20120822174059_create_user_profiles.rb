class CreateUserProfiles < ActiveRecord::Migration
  def up
    create_table(:user_profiles) do |t|
      t.integer :country_id, :null => false
      t.string :postal_code, :null => false
      t.integer :employment_status
      t.string :job_title, :null => false
      t.boolean :self_employed
      t.string :company, :null => false
      t.integer :industry
      t.string :email_assoc
      t.integer :plan_id
    end
  end

  def down
    drop_table :user_profiles
  end
end

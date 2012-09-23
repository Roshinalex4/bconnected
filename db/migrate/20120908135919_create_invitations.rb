class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.text :message

      t.timestamps
    end
  end
end

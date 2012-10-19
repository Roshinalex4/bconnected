class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :subject
      t.text :body
      t.integer :from_user
      t.integer :to_user
      t.integer :recipients_view_status
      t.integer :copy_to_author

      t.timestamps
    end
  end
end

class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.text :summary
      t.text :description
      t.string :link
      t.integer :user_id

      t.timestamps
    end
  end
end

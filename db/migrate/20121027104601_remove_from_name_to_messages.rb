class RemoveFromNameToMessages < ActiveRecord::Migration
  def up
    remove_column :messages, :from_name
  end

  def down
    add_column :messages, :from_name, :string
  end
end

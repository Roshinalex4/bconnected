class AddFromNameToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :from_name, :string
  end
end

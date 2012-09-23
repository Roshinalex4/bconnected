class AddOpenStatusToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :open_status, :boolean
  end
end

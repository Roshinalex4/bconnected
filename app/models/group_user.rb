class GroupUser < ActiveRecord::Base
  attr_accessible :group_id, :user_id, :status
	set_table_name :groups_users
end

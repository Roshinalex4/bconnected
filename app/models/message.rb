class Message < ActiveRecord::Base
  attr_accessible :body, :copy_to_author, :from_user, :recipients_view_status, :subject, :to_user
	belongs_to :user_profile
end

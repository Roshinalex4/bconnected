class Invitation < ActiveRecord::Base
  attr_accessible :from_user_id, :message, :to_user_id
end

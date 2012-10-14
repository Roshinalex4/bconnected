class Discussion < ActiveRecord::Base
  attr_accessible :description, :link, :summary, :user_id, :group_id
  belongs_to :group
end

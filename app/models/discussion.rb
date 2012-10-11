class Discussion < ActiveRecord::Base
  attr_accessible :description, :link, :summary, :user_id
end

class UserProfileSkill < ActiveRecord::Base
  attr_accessible :skill_id, :user_id
  belongs_to :user_profile
  belongs_to :skill
end

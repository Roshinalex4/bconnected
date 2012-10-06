class Language < ActiveRecord::Base
  attr_accessible :code, :name, :user_profile_id, :proficiency
  belongs_to :user_profile
end

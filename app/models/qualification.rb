class Qualification < ActiveRecord::Base
  attr_accessible :from_year, :institution, :name, :specialisation, :to_year,:user_profile_id
  belongs_to :user_profile
end

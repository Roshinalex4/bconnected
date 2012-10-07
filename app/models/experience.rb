class Experience < ActiveRecord::Base
  attr_accessible :company_name, :company_website, :currently_work, :description, :from_month, :from_year, :industry_id, :location, :title, :to_month, :to_year, :user_profile_id
  belongs_to :user_profile
end

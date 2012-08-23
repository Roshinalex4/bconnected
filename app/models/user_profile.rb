class UserProfile < ActiveRecord::Base
  attr_accessible :country_id, :postal_code, :employment_status, :job_title, :self_employed, :company, :industry, :email_assoc, :plan_id 
end
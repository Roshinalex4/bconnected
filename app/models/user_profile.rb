class UserProfile < ActiveRecord::Base
  attr_accessible :skill_ids, :country_id, :postal_code, :employment_status, :job_title, :self_employed, :company, :industry, :email_assoc, :plan_id 
  belongs_to :user
  has_many :user_profile_skills
  has_many :skills, :through => :user_profile_skills
end
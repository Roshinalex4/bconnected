class UserProfile < ActiveRecord::Base
  attr_accessible :display_name, :professional_headline, :maiden_name, :skill_ids, :country_id, :postal_code, :employment_status, :job_title, :self_employed, :company, :industry, :email_assoc, :plan_id, :description, :summary, :address_line_1, :address_line_2, :city, :state, :birthday, :marital_status  
  belongs_to :user
  has_many :user_profile_skills
  has_many :skills, :through => :user_profile_skills
  has_and_belongs_to_many :industries
end
class UserProfile < ActiveRecord::Base
  attr_accessible :display_name, :professional_headline, :maiden_name, :skill_ids, :country_id, 
                  :postal_code, :employment_status, :job_title, :self_employed, :company, :industry, :email_assoc, 
                  :plan_id, :description, :summary, :address, :city, :state, :birthday, :marital_status,
                  :phone_number, :phone_type, :im, :im_service, :address, :birth_day, :birth_month,
                  :birth_year, :website_1, :website_1_type, :website_2, :website_2_type, :website_3, :website_3_type,
                  :interests, :groups_associations, :honours_awards, :language_ids, :specialties, :picture
  belongs_to :user
  has_many :user_profile_skills
  has_many :skills, :through => :user_profile_skills
  has_and_belongs_to_many :industries
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  has_many :languages
  has_many :experiences
  has_many :qualifications
end
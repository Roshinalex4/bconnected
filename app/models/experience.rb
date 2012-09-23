class Experience < ActiveRecord::Base
  attr_accessible :company_name, :company_website, :currently_work, :description, :from_month, :from_year, :industry_id, :location, :title, :to_month, :to_year
end

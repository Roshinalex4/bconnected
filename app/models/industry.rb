class Industry < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :user_profiles
end

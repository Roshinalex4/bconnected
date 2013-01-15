class ProfileViewLog < ActiveRecord::Base
  attr_accessible :viewed_profile_of, :viewed_by
end

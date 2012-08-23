class UserProfilesController < ApplicationController
  def profile_basic
    @user_profile = UserProfile.new
  end
end

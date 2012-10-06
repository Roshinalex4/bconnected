class LanguagesController < ApplicationController
  def create
    @language = Language.new(params[:language])
    @language.user_profile_id = current_user.user_profile.id
    @language.save
    redirect_to '/user_profiles/view_user_profile'
  end
end
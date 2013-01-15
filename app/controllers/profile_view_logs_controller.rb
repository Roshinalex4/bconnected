class ProfileViewLogsController < ApplicationController
  def index
    @profile_viewers = User.joins('INNER JOIN profile_view_logs ON users.id = profile_view_logs.viewed_by').where('profile_view_logs.viewed_profile_of' => current_user.id)
  end
end
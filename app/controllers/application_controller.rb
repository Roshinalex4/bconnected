class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      if resource_or_scope.sign_in_count >= 1
        '/user_profiles/'+resource_or_scope.id.to_s+'/profile_basic'
      end
    else
      return '/home/index'
    end
  end

end

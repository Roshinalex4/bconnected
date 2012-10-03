class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      if resource_or_scope.sign_in_count > 1
        return '/user_profiles/email_add_form/'+ resource_or_scope.id.to_s
      else
        return '/user_profiles/profile_basic/' + resource_or_scope.id.to_s
      end
    else
      return '/users/sign_up'
    end
  end

end

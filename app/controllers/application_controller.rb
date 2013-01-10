class ApplicationController < ActionController::Base
  protect_from_forgery
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      if resource_or_scope.sign_in_count > 1
        return '/user_profiles/email_add_form/'+ resource_or_scope.id.to_s
      else
				if request.referer == "http://localhost:3000/users/sign_in"
					stored_location_for(resource)                                                                                                                  
				else
				  return '/user_profiles/view_user_profile'                  
				end 
      end
    else
      return '/users/sign_up'
    end
		
  end
  
end

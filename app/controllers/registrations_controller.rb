class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource_or_scope)
     if resource_or_scope.is_a?(User)
      #if resource_or_scope.sign_in_count > 1
       # return '/user_profiles/email_add_form/'+ resource_or_scope.id.to_s
      #else
        UserProfile.create(:display_name => current_user.first_name, :country_id => 0, 
                           :job_title => "", :postal_code => "", :user_id => current_user.id)
        return '/user_profiles/view_user_profile'
      #end
    else
      return '/users/sign_up'
    end
  end
end
class UserProfilesController < ApplicationController
  def profile_basic
    @user_profile = UserProfile.new
  end
  def create
    @user_profile = UserProfile.new(params[:user_profile])
    @user_profile.user_id = current_user.id
    respond_to do |format|
      if @user_profile.save
        #format.html { redirect_to @user_profile, notice: 'User profile was successfully created.' }
        #format.json { render json: @user_profile, status: :created, location: @user_profile }
        format.html { redirect_to email_add_form_user_profile_path(@user_profile), notice: 'User profile was successfully created.' }
        format.json { render json: email_add_form_user_profile_path(@user_profile), status: :created, location: @user_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def email_add_form
    @user_profile = UserProfile.find(params[:id])
  end
  
  def email_add
    @user_profile = UserProfile.find(params[:id])
    respond_to do |format|
      if @user_profile.update_attribute(:email_assoc, params[:user_profile][:email_assoc])
        format.html { redirect_to connect_with_form_user_profile_path, notice: 'Email was successfully added.' }
        format.json { head :no_content }
      else
        format.html { render action: "email_ad_form" }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end
  
  #Show the form 'Connect with people you know on Bconnected'
  def connect_with_form
    @user_profile = UserProfile.find(params[:id])
  end

  def enter_password
		@user_profile = UserProfile.find(params[:id])
  end
  
  def show_bconnected_contacts
    @contacts = Contacts::Yahoo.new(params[:user_profile][:email_assoc], params[:email][:password]).contacts
		@contacts = @contacts.map{|contact| "'"+contact[1]+"'"}
		@query = "SELECT `user_profiles`.email_assoc as email FROM `user_profiles` WHERE `user_profiles`.`email_assoc` IN ("+@contacts.join(',')+") UNION SELECT `users`.email FROM `users` WHERE `users`.`email` IN ("+@contacts.join(',')+")"
		@bconnected_contacts = UserProfile.find_by_sql(@query)
  end

  def show

  end
end

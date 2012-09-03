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
        format.html { redirect_to "/user_profiles/email_add_form/"+@user_profile.user_id.to_s, notice: 'User profile was successfully created.' }
        format.json { render json: email_add_form_user_profile_path(@user_profile), status: :created, location: @user_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def email_add_form
    @user_profile = UserProfile.where(:user_id => params[:user_id]).first
  end
  
  def email_add
    @user_profile = UserProfile.where(:user_id => params[:user_id]).first
    respond_to do |format|
      if @user_profile.update_attribute(:email_assoc, params[:user_profile][:email_assoc])
        format.html { redirect_to "/user_profiles/connect_with_form/"+ @user_profile.user_id.to_s, notice: 'Email was successfully added.' }
        format.json { head :no_content }
      else
        format.html { render action: "email_ad_form" }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end
  
  #Show the form 'Connect with people you know on Bconnected'
  def connect_with_form
    @user_profile = UserProfile.where(:user_id => params[:user_id]).first
  end

  def enter_password_to_connect
		@user_profile = UserProfile.where(:user_id => params[:user_id]).first
  end
  
  def show_bconnected_contacts
		if params[:user_profile][:email_assoc].split("@").last.include?("yahoo") 
			@contacts = Contacts::Yahoo.new(params[:user_profile][:email_assoc], params[:email][:password]).contacts
		elsif params[:user_profile][:email_assoc].split("@").last.include?("gmail") 
			@contacts = Contacts::Gmail.new(params[:user_profile][:email_assoc], params[:email][:password]).contacts
		end
    @contacts = @contacts.map{|contact| "'"+contact[1]+"'"}
		@query = "SELECT user_profiles.email_assoc as email FROM user_profiles WHERE user_profiles.email_assoc IN ("+@contacts.join(',')+") UNION SELECT users.email FROM users WHERE users.email IN ("+@contacts.join(',')+")"
		@bconnected_contacts = UserProfile.find_by_sql(@query)
  end

	def invite_contacts_form
		@user_profile = UserProfile.where(:user_id => params[:user_id]).first
	end

	def show_email_contacts
		@user_profile = UserProfile.where(:user_id => params[:user_id]).first
		if params[:user_profile][:email_assoc].split("@").last.include?("yahoo") 
			@contacts = Contacts::Yahoo.new(params[:user_profile][:email_assoc], params[:email][:password]).contacts
		elsif params[:user_profile][:email_assoc].split("@").last.include?("gmail") 
			@contacts = Contacts::Gmail.new(params[:user_profile][:email_assoc], params[:email][:password]).contacts
		end
	end

	def enter_password_to_invite
		@user_profile = UserProfile.where(:user_id => params[:user_id]).first
	end

  def show

  end
end

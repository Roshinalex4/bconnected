class UserProfilesController < ApplicationController
  layout "user_profile"
	respond_to :js
	
	def home
	  @contacts = User.joins('INNER JOIN connections ON connections.friend_id = users.id').limit(3)
	  @user_profile = UserProfile.where(:user_id => current_user.id).first
	end
	
	def following
	  
	end
  def save_skills
    params[:user_profile][:skill_ids] ||= []
    @user_profile = UserProfile.find_by_user_id(current_user.id)
    @user_profile.update_attributes(params[:user_profile])
		respond_to do |format|
      if @user_profile.update_attributes(params[:user_profile])
        format.html { redirect_to "/user_profiles/view_user_profile/", notice: 'User profile was successfully created.' }
        format.json { render json: "/user_profiles/view_user_profile/", status: :created, location: @user_profile }
      else
        format.html { render action: add_summary_user_profile_path(@user_profile) }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def add_skills
    @user_profile = UserProfile.find_by_user_id(current_user.id)
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
    @contacts = User.joins('INNER JOIN connections ON connections.friend_id = users.id').limit(3)
    @user_profile = UserProfile.where(:user_id => params[:user_id]).first
  end

  def enter_password_to_connect
    @contacts = User.joins('INNER JOIN connections ON connections.friend_id = users.id').limit(3)
		@user_profile = UserProfile.where(:user_id => params[:user_id]).first
  end
  
  def show_bconnected_contacts
    #@user_profile = UserProfile.where(:user_id => params[:user_id]).first
    #@bconnected_contacts = User.where(:email => "rashilafs@gmail.com").select("email") 
		if params[:user_profile][:email_assoc].split("@").last.include?("yahoo") 
			 @contacts = Contacts::Yahoo.new(params[:user_profile][:email_assoc], params[:email][:password]).contacts
		elsif params[:user_profile][:email_assoc].split("@").last.include?("gmail") 
			@contacts = Contacts::Gmail.new(params[:user_profile][:email_assoc], params[:email][:password]).contacts
		end
    @contacts = @contacts.map{|contact| "'"+contact[1]+"'"}
		@query = "SELECT user_profiles.email_assoc as email, user_id as user_id FROM user_profiles WHERE user_profiles.email_assoc IN ("+@contacts.join(',')+") UNION SELECT users.email, users.id as user_id FROM users WHERE users.email IN ("+@contacts.join(',')+")"
		@bconnected_contacts = UserProfile.find_by_sql(@query)
		@connection = Connection.new
	end

	def invite_contacts_form
	  @contacts = User.joins('INNER JOIN connections ON connections.friend_id = users.id').limit(3)
		@user_profile = UserProfile.where(:user_id => params[:user_id]).first
	end

	def show_email_contacts
		@user_profile = UserProfile.where(:user_id => params[:user_id]).first
		if params[:user_profile][:email_assoc].split("@").last.include?("yahoo") 
			@contacts = Contacts::Yahoo.new(params[:user_profile][:email_assoc], params[:email][:password]).contacts
		elsif params[:user_profile][:email_assoc].split("@").last.include?("gmail") 
			@contacts = Contacts::Gmail.new(params[:user_profile][:email_assoc], params[:email][:password]).contacts
		end
		@connection = Connection.new
	end

	def enter_password_to_invite
	  @contacts = User.joins('INNER JOIN connections ON connections.friend_id = users.id').limit(3)
		@user_profile = UserProfile.where(:user_id => params[:user_id]).first
	end
	
	def add_profile_basic
    @user_profile = UserProfile.find_by_user_id(current_user.id) || UserProfile.new
  end
  def create_profile_basic
    @user_profile = UserProfile.new(params[:user_profile])
    @user_profile.user_id = current_user.id
    @user_profile.job_title = params[:user_profile][:professional_headline]
    @user = User.find(current_user.id)
    @user.update_attributes(params[:user])
    respond_to do |format|
      if @user_profile.save
        #format.html { redirect_to @user_profile, notice: 'User profile was successfully created.' }
        #format.json { render json: @user_profile, status: :created, location: @user_profile }
        format.html { redirect_to "/user_profiles/view_user_profile/", notice: 'User profile was successfully created.' }
        format.json { render json: email_add_form_user_profile_path(@user_profile), status: :created, location: @user_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def add_personal_info
    @user_profile = UserProfile.find_by_user_id(current_user.id) || UserProfile.new
  end
  
  def create_personal_info
    @user_profile = current_user.user_profile
    respond_to do |format|
      if @user_profile.update_attributes(params[:user_profile])
        format.html { redirect_to "/user_profiles/view_user_profile/", notice: 'User profile was successfully created.' }
        format.json { render json: "/user_profiles/view_user_profile/", status: :created, location: @user_profile }
      else
        format.html { render action: add_personal_info_user_profile_path(@user_profile) }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def add_summary
    @user_profile = UserProfile.find_by_user_id(current_user.id) || UserProfile.new
  end 
  
  def create_summary
    @user_profile = current_user.user_profile
    respond_to do |format|
      if @user_profile.update_attributes(params[:user_profile])
        format.html { redirect_to "/user_profiles/view_user_profile/", notice: 'User profile was successfully created.' }
        format.json { render json: "/user_profiles/view_user_profile/", status: :created, location: @user_profile }
      else
        format.html { render action: add_summary_user_profile_path(@user_profile) }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end
  def add_additional_info 
    @user_profile = UserProfile.find_by_user_id(current_user.id) || UserProfile.new
  end 
  def create_additional_info
    @user_profile = current_user.user_profile
    respond_to do |format|
      if @user_profile.update_attributes(params[:user_profile])
        format.html { redirect_to "/user_profiles/view_user_profile/", notice: 'User profile was successfully created.' }
        format.json { render json: "/user_profiles/view_user_profile/", status: :created, location: @user_profile }
      else
        format.html { render action: add_additional_info_user_profile_path(@user_profile) }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end
  def add_languages
    @user_profile = UserProfile.find_by_user_id(current_user.id) || UserProfile.new
    @language = Language.new
  end
  
  def add_profile_photo
    @user_profile = current_user.user_profile
  end
  def create_profile_photo
    @user_profile = current_user.user_profile
    respond_to do |format|
      if @user_profile.update_attributes(params[:user_profile])
        format.html { redirect_to view_user_profile_user_profiles_path, notice: 'User profile was successfully created.' }
        format.json { render json: view_user_profile_user_profiles_path, status: :created, location: @user_profile }
      else
        format.html { render action: "add_profile_photo" }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end
  def view_user_profile
    @user_profile = UserProfile.find_by_user_id(current_user.id)
  end
  def search
		
    @users = User.where("(first_name like ? or last_name like ?) and id <> ?", "%#{params[:user][:first_name]}%", "%#{params[:user][:last_name]}%", current_user.id)
  end

	def filter
		@contacts = User.where("(first_name like ? or last_name like ?) and id <> ?", "%#{params[:user][:first_name]}%", "%#{params[:user][:first_name]}%", current_user.id)
		render 'connections/index'
	end

	def show
		@user_profile = UserProfile.find(params[:id])
	end

	def connect
		@connection = Connection.new
		@connection.user_id = current_user.id
		@connection.friend_id = params[:id]
		@connection.save
	end
	
	def settings
	  
	end
  
end

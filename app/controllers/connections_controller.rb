class ConnectionsController < ApplicationController
  layout "contacts"
  def create 
		contacts_array = Array.new
		if params[:commit] == "Add Connection"      
			params[:send_invite][:email_contact].each {|k,v| contacts_array << v if v.length > 0 }
		  contacts_array.each do |email_contact| 
		    user = User.find(email_contact)
				@connection = Connection.new
				@connection.user_id = current_user.id
				@connection.friend_id = email_contact
				@connection.save

		    @invitation = Invitation.new
		    @invitation.from_user_id = @connection.user_id
		    @invitation.to_user_id = @connection.friend_id
		    @action = "/user_profiles/invite_contacts_form/"+current_user.id.to_s
		  end
		else
			params[:email_contacts].each  do |contact|
				if contact.length > 0
					send_invitation_email(contact)
				end
			end
			@action = "/user_profiles/home"
		end                                         
    #Loop through all email ids                    
      #Send Invitation Email through bconnected    
      #[Create Email Model]                        
      #[Create EmailTemplate Model]                
    #End Loop    
    redirect_to @action                                  
  end    
  
  def index
    @contacts = User.joins('INNER JOIN connections ON connections.friend_id = users.id')
  end  

	def send_invitation_email(contact)
		 UserMailer.invitation(contact, "http://"+request.host_with_port).deliver 
	end    
	
	def show
	  enter_profile_log(params[:id])
	  @user_profile = UserProfile.find_by_user_id(params[:id])
	end   
	
	def enter_profile_log(user_id)
	  @profile_view_log = ProfileViewLog.new(:viewed_profile_of => user_id, :viewed_by => current_user.id)
	  @profile_view_log.save
	end                                 
end

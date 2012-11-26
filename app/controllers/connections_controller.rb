class ConnectionsController < ApplicationController
  def create       
		contacts_array = Array.new
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
			redirect_to "/user_profiles/invite_contacts_form/"+current_user.id.to_s
    end                                            
    #Loop through all email ids                    
      #Send Invitation Email through bconnected    
      #[Create Email Model]                        
      #[Create EmailTemplate Model]                
    #End Loop                                      
  end    
  
  def index
    @contacts = Connection.all
  end                                          
end

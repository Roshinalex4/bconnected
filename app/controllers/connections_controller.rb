class ConnectionsController < ApplicationController
  def create                                  
    params[:send_invite].each do |email_contact| 
      puts email_contact          
      user = User.find(email_contact)
			@connection = Connection.new
			@connection.user_id = current_user.id
			@connection.friend_id = email_contact
			@connection.save

      @invitation = Invitation.new
      @invitation.from_user_id = @connection.user_id
      @invitation.to_user_id = @connection.friend_id
			redirect_to create_invitation_path(:invitation => @invitation)                              
    end                                            
    #Loop through all email ids                    
      #Send Invitation Email through bconnected    
      #[Create Email Model]                        
      #[Create EmailTemplate Model]                
    #End Loop                                      
  end                                              
end

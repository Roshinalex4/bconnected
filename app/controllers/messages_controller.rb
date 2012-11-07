class MessagesController < ApplicationController
	
	respond_to :html, :json
	autocomplete :message, :users, :full => true

	def get_autocomplete_items(parameters)
		super(parameters).users
	end

	#Show a list of messages in inbox
	def index
		@messages = Message.find_by_sql("select * from messages where find_in_set('"+current_user.id.to_s+"', to_user);")
		respond_with(@messages) 
	end

	#Compose a message
	def new
		
		if params[:reply]==	"on"
			@message = Message.find(params[:message_id])
			@to_users = @message.to_user.split(",")
		else
			@message = Message.new
		end
		@users = User.find(:all)
		@users = @users.map { |x| x.email }
		@autocomplete_users = @users.to_json.html_safe
		respond_with(@message)
	end

	#Send a message 
	def create
		@message = Message.new(params[:message])
		
		@message.to_user = params[:to_user].join(",")
		sender = UserProfile.where(:user_id => current_user.id)[0]
		@message.from_user = sender.id
		respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully sent.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
	end

	#View
	def show
		@message = Message.find(params[:id])
		respond_with(@message)
	end

	#Delete a message
	def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end

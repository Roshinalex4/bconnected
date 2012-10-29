class MessagesController < ApplicationController
	
	respond_to :html, :json
	autocomplete :message, :users, :full => true

	def get_autocomplete_items(parameters)
		super(parameters).users
	end

	#Show a list of messages in inbox
	def index
		@messages = Message.where(:to_user => current_user.id)
		respond_with(@messages) 
	end

	#Compose a message
	def new
		@message = Message.new
		@users = User.find(:all)
		@users = @users.map { |x| x.email }
		@autocomplete_users = @users.to_json.html_safe
		respond_with(@message)
	end

	#Send a message
	def create
		@message = Message.new(params[:message])
		@users = Array.new
		@users = params[:users].split(",")
		@user_list = User.where(:email => @users )
		to_user = ""
		@user_list.each do |usr|
			to_user = to_user+","+usr.id.to_s
		end
		@message.to_user = to_user
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
	#def delete
		
	#end

end

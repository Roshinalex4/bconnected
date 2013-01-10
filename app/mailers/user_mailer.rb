class UserMailer < ActionMailer::Base
  default from: "from@example.com"
	def invitation(email, home_link)  
		@home_link = home_link
    mail(:to => email, :subject => "Join Madison WhoSWho", :from => "madison@madison.com")  
  end 
end

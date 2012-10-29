class GroupMailer < ActionMailer::Base
  default from: "from@example.com"

	def join_notification_email(user, group)
    @user = user
		@group = group
    @url  = "http://localhost:3000"
		creator = User.find(group.creator)
    mail(:to => creator.email, :subject => user.email+" has sent a join request to your group.")
  end
end

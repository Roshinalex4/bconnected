class GroupMailer < ActionMailer::Base
  default from: "from@example.com"

	def join_notification_email(user, group, root_url)
    @user = user
		@group = group
    @url  = "http://"+root_url
		@approve_url = "http://"+root_url+"/groups/"+@group.id.to_s+"/approve?user="+@user.id.to_s
		@reject_url = "http://"+root_url+"/groups/"+@group.id.to_s+"/reject?user="+@user.id.to_s
		creator = User.find(group.creator)
    mail(:to => creator.email, :subject => user.email+" has sent a join request to your group.")
  end
end

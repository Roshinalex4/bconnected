module DiscussionsHelper
  def discussion_user_picture_url(discussion)
    user = User.find(discussion.user_id) if discussion.user_id 
    return user.user_profile.picture.url(:thumb) if discussion.user_id 
  end
end

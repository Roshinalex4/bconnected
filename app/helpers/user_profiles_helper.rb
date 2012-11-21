module UserProfilesHelper
	def user_connected(id)
		connections = Connection.where(:user_id => current_user.id, :friend_id => id)
		if connections.count > 0
			return true
		else
			return false
		end
	end
end

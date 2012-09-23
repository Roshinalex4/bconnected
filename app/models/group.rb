class Group < ActiveRecord::Base
  attr_accessible :access, :allo_invite_others, :allow_display_logo, :check_agreement, :country_id, :creator, :description, :display_in_directory, :group_name, :group_owner_email, :group_type, :language, :single_location, :summary, :website, :postal_code, :open_status, :logo
  has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end

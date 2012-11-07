class ChangeDataTypeForMessagesToUser < ActiveRecord::Migration
	def change  
	 change_table :messages do |t|  
  	 t.change :to_user, :string 
	 end
	end 
end

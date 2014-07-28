class AddAvatarToTenants < ActiveRecord::Migration
  def change
  	add_attachment :tenants, :avatar
  end
end

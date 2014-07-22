class Building < ActiveRecord::Base
	has_many :tenants
	has_many :issues, through: :tenants
	belongs_to :company
	belongs_to :manager

	# def avg_time_for_complain_to_complete
	# 	self.tenants.each do |tenant|
	# 		tenant.each do|issue|
	# 			issue.completed_time - issue.created_time
	# 		end
	# 	end
	# end

end

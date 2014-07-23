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
	# def no_of_new_issues
	# 	new_issues = []
	# 		issues.each do |issue|
	#  		if issue.status == "new"
	#  			new_issues.push(issue.status)
	#  		end
	#  		return new_issues.count
	#  	end
	# end

	# def no_of_done_issues
	# 	done_issues = []
	#  		issues.each do |issue|
	#  		if issue.status == "done"
	#  			done_issues.push(issue.status)
	#  		end
	#  		return done_issues.count
	# 	end
	# end

	# def avg_time_for_complain
	# 	array = []
	# 	issues.each do |issue|
	# 		array.push{issues.completed_date - issues.created_time}
	# 	end
	# 	array / issues.count
	# end
end









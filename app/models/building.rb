class Building < ActiveRecord::Base
	has_many :tenants
	has_many :issues, through: :tenants
	belongs_to :company
	belongs_to :manager

	def unresolved_issues
		issues.where.not(status: 'done')
	end

	def no_of_new_issues
		issues.where(status: 'new').count
	end

	def no_of_done_issues
		completed_issues.count
	end

	def approved_tenants
		tenants.where(is_approved: true)
	end

	def completed_issues
		issues.where(status: 'done')
	end

	def avg_issue_time
		d = completed_issues
		if d.any?
			(d.reduce(0) {|t, i| t+= (i.complete_date - i.created_at)} / d.count / 60 / 60 / 24).floor
		else
			'--'
		end
	end

	def avg_issues_rating
		i = completed_issues
		if i.count > 0
			avg = i.reduce(0) {|t, i| t+=i.rating}
			avg /= i.count
		else
			'--'
		end
	end

	# def avg_time_for_completion
	# 	(issues.where(status: 'done').pluck(:complete_date, :created_at).reduce(0) do |total, (complete_date, created_at)|
	# 		total += complete_date - created_at
	# 	end / issues.where(status: 'done').count / 3600 / 24).floor
	# end

	def avg_rating
		('%.2f' % issues.average(:rating).to_f).to_f
	end

	def vals_for_select
		"#{street}, #{city}, #{country}"
	end

	def full_address
		"#{street}, #{postal_code}, #{city}, #{country}"
	end

end

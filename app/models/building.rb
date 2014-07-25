class Building < ActiveRecord::Base
	has_many :tenants
	has_many :issues, through: :tenants
	belongs_to :company
	belongs_to :manager

	def no_of_new_issues
		issues.where(created_at: (Date.current.beginning_of_day..Date.current.end_of_day)).count
	end

	def no_of_done_issues
		issues.where(status: 'done').count
	end

	def avg_time_for_completion
		(issues.where(status: 'done').pluck(:complete_date, :created_at).reduce(0) do |total, (complete_date, created_at)|
			total += complete_date - created_at
		end / issues.where(status: 'done').count / 3600 / 24).floor
	end

	def avg_rating
		('%.2f' % issues.average(:rating).to_f).to_f
	end

	def vals_for_select
		"#{street}, #{city}, #{country}"
	end

end

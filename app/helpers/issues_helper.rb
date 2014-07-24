module IssuesHelper

	def show_issue_status(issue)
		case issue.status
		when 'done'
			return "<span class='badge badge-success'>Solved</span>".html_safe
		when 'new'
			return "<span class='badge badge-warning'>In progress</span>".html_safe
		else
			return "<span class='badge badge-default'>Unknown</span>".html_safe
		end
	end

	def issue_duration(issue)
		issue.complete_date.nil? ? "#{seconds_to_days(issue.duration)} days since issue created" : "solved in #{seconds_to_days(issue.duration)} days"
	end

end

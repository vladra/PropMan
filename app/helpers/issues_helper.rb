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
end

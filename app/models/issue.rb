class Issue < ActiveRecord::Base
	has_many :comments
	belongs_to :tenant
	has_and_belongs_to_many :categories

	statuses = [:done]

	def duration
		if complete_date.nil?
			(Time.now - created_at).floor
		else
			(complete_date - created_at).floor
		end
	end

end

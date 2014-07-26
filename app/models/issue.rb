class Issue < ActiveRecord::Base
	has_many :comments
	belongs_to :tenant
	has_and_belongs_to_many :categories

	before_validation :set_status_new, on: [:create]
	before_validation :check_if_done, on: [:update]

	def set_status_new
		self.status = :new
	end

	def check_if_done
		if self.status = 'done'
			self.complete_date = Time.now
		else
			self.complete_date = nil
		end
	end

	def duration
		if complete_date.nil?
			(Time.now - created_at).floor
		else
			(complete_date - created_at).floor
		end
	end

	def self.statuses
		[:new, :pending, :done]
	end

end

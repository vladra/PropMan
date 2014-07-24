class Tenant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :issues
	has_many :comments, as: :commentable
	belongs_to :building

	def full_name
		"#{first_name} #{last_name}"
	end

	def recent_issues
		issues.order('created_at desc').limit(5)
	end

	def num_of_pending_issues
		issues.where.not(status: 'done').count
	end

	def completed_issues
		issues.where.not(complete_date: nil)
	end

	def avg_issue_time
		d = completed_issues
		if d.any?
			d.pluck(:complete_date, :created_at).reduce(0) {|t, i| t+= (i.complete_date - i.created_at)} / d.count / 60 / 60 / 24
		else
			'--'
		end
	end

end

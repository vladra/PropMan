class Tenant < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :issues
	has_many :comments, as: :commentable
	belongs_to :building

	before_validation :reset_building_status, on: [:update_building]

	def reset_building_status
		self.is_approved = nil
	end

	def full_name
		"#{first_name} #{last_name}"
	end

	def recent_issues
		issues.order('created_at desc').limit(5)
	end

	def num_of_pending_issues
		issues.where.not(status: 'done').count
	end

	def unresolved_issues
		issues.where(status: ['new', 'pending'])
	end

	def completed_issues
		issues.where.not(complete_date: nil)
	end

	def avg_issue_time
		d = completed_issues
		if d.any?
			(d.reduce(0) {|t, i| t+= (i.complete_date - i.created_at)} / d.count / 60 / 60 / 24).floor
		else
			'--'
		end
	end

end

# See Manager model for more details on how this class.

class Tenant::ParameterSanitizer < Devise::ParameterSanitizer
  def account_update
    default_params.permit(:first_name, :last_name, :phone_number)
  end
end

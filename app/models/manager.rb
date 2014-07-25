class Manager < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :buildings
	has_many :companies, through: :buildings
	has_many :issues, through: :buildings
	has_many :comments, as: :commentable

		def no_of_new_issues
		issues.where(created_at: (Date.current.beginning_of_day..Date.current.end_of_day)).count
	end

	def no_of_done_issues
		issues.where(status: 'done').count
	end

	def avg_time_for_completion
		if issues.count > 0
			(issues.where(status: 'done').pluck(:complete_date, :created_at).reduce(0) do |total, (complete_date, created_at)|
				total += complete_date - created_at
			end / issues.where(status: 'done').count / 3600 / 24).floor
		end
	end

	def avg_rating
		('%.2f' % issues.average(:rating).to_f).to_f
	end

end

# The following class can be placed inside a module within the /lib folder of the app
# The purpose of the class is to handle the strong parameter sanitization for multiple
# models as we have used in this app.

# One of these classes is needed for each type of resource in devise (i.e. Manager, Tenant)

# See the application controller for how it is enabled for controllers.

# https://github.com/plataformatec/devise#strong-parameters

class Manager::ParameterSanitizer < Devise::ParameterSanitizer
  def account_update
    default_params.permit(:first_name, :last_name, :phone_number)
  end
end

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
end

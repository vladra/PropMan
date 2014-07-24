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
end

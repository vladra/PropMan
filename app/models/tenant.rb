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
end

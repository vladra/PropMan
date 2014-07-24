class Manager < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :buildings
	has_many :companies, through: :buildings
	has_many :issues, through: :buildings
	has_many :comments, as: :commentable
end

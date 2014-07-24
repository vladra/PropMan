class Manager < ActiveRecord::Base
	has_many :buildings
	has_many :companies, through: :buildings
	has_many :issues, through: :buildings
	has_many :comments, as: :commentable
end

class Manager < ActiveRecord::Base
	acts_as :user
	has_many :buildings
	has_many :companies, through: :buildings
	has_many :issues, through: :buildings
end

class Company < ActiveRecord::Base
	acts_as :user
	has_many :buildings
	has_many :managers, through: :buildings
end

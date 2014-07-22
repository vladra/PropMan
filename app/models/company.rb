class Company < ActiveRecord::Base
	has_many :buildings
	has_many :managers, through: :buildings
end

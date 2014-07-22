class Tenant < ActiveRecord::Base
	acts_as :user
	has_many :issues
	belongs_to :building
end

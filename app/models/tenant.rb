class Tenant < ActiveRecord::Base
	has_many :issues
	belongs_to :building
end

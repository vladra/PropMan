class Building < ActiveRecord::Base
	has_many :tenants
	has_many :issues, through: :tenants
	belongs_to :company
	belongs_to :manager
end

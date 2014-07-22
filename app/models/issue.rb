class Issue < ActiveRecord::Base
	has_many :comments
	belongs_to :tenant
	has_and_belongs_to_many :categories
end

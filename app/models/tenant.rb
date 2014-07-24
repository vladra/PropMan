class Tenant < ActiveRecord::Base
	has_many :issues
	has_many :comments, as: :commentable
	belongs_to :building
end

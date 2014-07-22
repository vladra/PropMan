class User < ActiveRecord::Base
	acts_as_superclass
	has_many :comments
end

class Category < ActiveRecord::Base
	has_and_belongs_to_many :issues
	belongs_to :parent_category, class_name: "Category", foreign_key: :parent_id
	has_many :subcategories, class_name: "Category", foreign_key: :parent_id
end

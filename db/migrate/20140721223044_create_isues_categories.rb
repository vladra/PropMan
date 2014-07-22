class CreateIsuesCategories < ActiveRecord::Migration
  def change
    create_table :isues_categories, id: false do |t|
    	t.belongs_to :issue
    	t.belongs_to :category
    end
  end
end

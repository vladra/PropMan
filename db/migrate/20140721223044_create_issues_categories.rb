class CreateIssuesCategories < ActiveRecord::Migration
  def change
    create_table :categories_issues, id: false do |t|
    	t.belongs_to :issue
    	t.belongs_to :category
    end
  end
end

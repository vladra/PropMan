class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :title
      t.text :message
      t.string :status
      t.datetime :complete_date
      t.integer :rating
      t.belongs_to :tenant

      t.timestamps
    end
  end
end

class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.belongs_to :issue
      t.belongs_to :user

      t.timestamps
    end
  end
end

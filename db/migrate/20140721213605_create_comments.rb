class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.belongs_to :issue
      t.references :commentable, polymorphic: true

      t.timestamps
    end
  end
end

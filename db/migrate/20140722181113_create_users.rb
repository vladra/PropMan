class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, :as_relation_superclass => true do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :phone_number

      t.timestamps
    end
  end
end

class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :email
      t.string :phone_number
      t.string :address
      t.string :company_name

      t.timestamps
    end
  end
end

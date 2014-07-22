class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :email
      t.string :phone_number
      t.string :apartment
      t.boolean :is_approved
      t.belongs_to :building

      t.timestamps
    end
  end
end

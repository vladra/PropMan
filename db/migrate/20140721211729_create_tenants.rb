class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :apartment
      t.boolean :is_approved
      t.belongs_to :building

      t.timestamps
    end
  end
end

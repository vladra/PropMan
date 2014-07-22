class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :street
      t.string :postal_code
      t.string :city
      t.string :country
      t.belongs_to :company
      t.belongs_to :manager

      t.timestamps
    end
  end
end

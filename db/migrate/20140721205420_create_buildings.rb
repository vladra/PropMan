class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :address
      t.belongs_to :company
      t.belongs_to :manager

      t.timestamps
    end
  end
end

class CreateSuers < ActiveRecord::Migration
  def change
    create_table :suers do |t|
      t.string :name
      t.string :email
      t.string :login

      t.timestamps
    end
  end
end

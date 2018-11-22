class CreateAdhesions < ActiveRecord::Migration[5.1]
  def change
    create_table :adhesions do |t|
      t.string :name
      t.string :phone
      t.string :date
      t.string :adresse
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end

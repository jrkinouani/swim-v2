class CreateReservationstatics < ActiveRecord::Migration[5.1]
  def change
    create_table :reservationstatics do |t|
      t.date :start
      t.string :phone
      t.integer :price
      t.string :name
      t.string :creneau
      t.references :staticswim, foreign_key: true

      t.timestamps
    end
  end
end

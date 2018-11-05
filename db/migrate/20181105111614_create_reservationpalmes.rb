class CreateReservationpalmes < ActiveRecord::Migration[5.1]
  def change
    create_table :reservationpalmes do |t|
      t.date :start
      t.string :phone
      t.integer :price
      t.string :name
      t.string :creneau
      t.references :palme, foreign_key: true

      t.timestamps
    end
  end
end

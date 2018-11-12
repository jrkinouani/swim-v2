class CreateReservationsynchros < ActiveRecord::Migration[5.1]
  def change
    create_table :reservationsynchros do |t|
      t.date :start
      t.string :name
      t.string :creneau
      t.integer :price
      t.string :phone
      t.references :nagesynchro, foreign_key: true

      t.timestamps
    end
  end
end

class CreateReservationjards < ActiveRecord::Migration[5.1]
  def change
    create_table :reservationjards do |t|
      t.date :start
      t.string :name
      t.string :creneau
      t.string :phone
      t.integer :price
      t.references :jardin, foreign_key: true

      t.timestamps
    end
  end
end

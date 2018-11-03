class CreateReservationads < ActiveRecord::Migration[5.1]
  def change
    create_table :reservationads do |t|
      t.date :start
      t.string :phone
      t.string :name
      t.string :creneau
      t.references :adulte, foreign_key: true

      t.timestamps
    end
  end
end

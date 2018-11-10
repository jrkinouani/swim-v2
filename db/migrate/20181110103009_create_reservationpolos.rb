class CreateReservationpolos < ActiveRecord::Migration[5.1]
  def change
    create_table :reservationpolos do |t|
      t.date :start
      t.integer :price
      t.string :name
      t.string :phone
      t.string :creneau
      t.references :polo, foreign_key: true

      t.timestamps
    end
  end
end

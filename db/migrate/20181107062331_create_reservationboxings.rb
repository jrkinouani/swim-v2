class CreateReservationboxings < ActiveRecord::Migration[5.1]
  def change
    create_table :reservationboxings do |t|
      t.integer :price
      t.date :start
      t.string :phone
      t.string :name
      t.string :creneau
      t.references :aquaboxing, foreign_key: true

      t.timestamps
    end
  end
end

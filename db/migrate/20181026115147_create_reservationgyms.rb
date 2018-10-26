class CreateReservationgyms < ActiveRecord::Migration[5.1]
  def change
    create_table :reservationgyms do |t|
      t.date :start
      t.integer :price
      t.references :aquagym, foreign_key: true

      t.timestamps
    end
  end
end

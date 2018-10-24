class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.integer :price
      t.date :start
      t.references :aquabike, foreign_key: true

      t.timestamps
    end
  end
end

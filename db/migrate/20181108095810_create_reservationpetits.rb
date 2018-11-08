class CreateReservationpetits < ActiveRecord::Migration[5.1]
  def change
    create_table :reservationpetits do |t|
      t.date :start
      t.integer :price
      t.string :creneau
      t.string :phone
      t.string :name
      t.boolean :adhesion
      t.references :nagepetit, foreign_key: true

      t.timestamps
    end
  end
end

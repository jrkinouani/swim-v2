class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.date :start_at
      t.integer :creneau

      t.timestamps
    end
  end
end

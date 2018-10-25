class AddHoraireToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :horaire, :string
  end
end

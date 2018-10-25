class AddHoraire1ToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :horaire1, :string
  end
end

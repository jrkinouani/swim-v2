class RemoveHoraire1FromReservations < ActiveRecord::Migration[5.1]
  def change
    remove_column :reservations, :horaire1, :string
  end
end

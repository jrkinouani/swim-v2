class RemoveHoraireFromReservations < ActiveRecord::Migration[5.1]
  def change
    remove_column :reservations, :horaire, :string
  end
end

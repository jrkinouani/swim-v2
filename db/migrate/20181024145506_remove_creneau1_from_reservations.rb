class RemoveCreneau1FromReservations < ActiveRecord::Migration[5.1]
  def change
    remove_column :reservations, :creneau1, :string
  end
end

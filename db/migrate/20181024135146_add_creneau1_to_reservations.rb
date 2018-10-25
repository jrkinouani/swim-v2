class AddCreneau1ToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :creneau1, :string
  end
end

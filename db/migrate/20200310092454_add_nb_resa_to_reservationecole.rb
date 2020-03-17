class AddNbResaToReservationecole < ActiveRecord::Migration[5.1]
  def change
    add_column :reservationecoles, :nb_resa, :integer
  end
end

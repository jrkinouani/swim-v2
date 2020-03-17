class AddUserAndNbResaToReservationads < ActiveRecord::Migration[5.1]
  def change
    add_reference :reservationads, :user, foreign_key: true
    add_column :reservationads, :nb_resa, :integer
  end
end

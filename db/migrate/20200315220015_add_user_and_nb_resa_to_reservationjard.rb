class AddUserAndNbResaToReservationjard < ActiveRecord::Migration[5.1]
  def change
    add_reference :reservationjards, :user, foreign_key: true
    add_column :reservationjards, :nb_resa, :interger
  end
end

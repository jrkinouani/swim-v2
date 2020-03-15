class AddUserAndNbResaToReservationpetits < ActiveRecord::Migration[5.1]
  def change
    add_reference :reservationpetits, :user, foreign_key: true
    add_column :reservationpetits, :nb_resa, :interger
  end
end

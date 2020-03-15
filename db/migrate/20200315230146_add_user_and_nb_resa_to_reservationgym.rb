class AddUserAndNbResaToReservationgym < ActiveRecord::Migration[5.1]
  def change
    add_reference :reservationgyms, :user, foreign_key: true
    add_column :reservationgyms, :nb_resa, :interger
  end
end

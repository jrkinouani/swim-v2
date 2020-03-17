class AddUserAndNbResaToReservationpalme < ActiveRecord::Migration[5.1]
  def change
    add_reference :reservationpalmes, :user, foreign_key: true
    add_column :reservationpalmes, :nb_resa, :integer
  end
end

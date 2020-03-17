class AddUserAndNbResaToReservation < ActiveRecord::Migration[5.1]
  def change
    add_reference :reservations, :user, foreign_key: true
    add_column :reservations, :nb_resa, :integer
  end
end

class AddUserToReservationecole < ActiveRecord::Migration[5.1]
  def change
    add_reference :reservationecoles, :user, foreign_key: true
  end
end

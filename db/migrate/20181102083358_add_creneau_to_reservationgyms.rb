class AddCreneauToReservationgyms < ActiveRecord::Migration[5.1]
  def change
    add_column :reservationgyms, :creneau, :string
  end
end

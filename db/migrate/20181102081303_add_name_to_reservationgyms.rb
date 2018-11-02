class AddNameToReservationgyms < ActiveRecord::Migration[5.1]
  def change
    add_column :reservationgyms, :name, :string
  end
end

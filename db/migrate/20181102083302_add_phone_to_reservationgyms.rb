class AddPhoneToReservationgyms < ActiveRecord::Migration[5.1]
  def change
    add_column :reservationgyms, :phone, :string
  end
end

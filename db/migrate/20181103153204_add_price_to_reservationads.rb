class AddPriceToReservationads < ActiveRecord::Migration[5.1]
  def change
    add_column :reservationads, :price, :integer
  end
end

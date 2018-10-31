class AddCreneauToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :creneau, :string
  end
end

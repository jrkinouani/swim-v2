class AddDureeToAquabikes < ActiveRecord::Migration[5.1]
  def change
    add_column :aquabikes, :duree, :string
  end
end

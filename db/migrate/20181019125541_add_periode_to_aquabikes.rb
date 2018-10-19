class AddPeriodeToAquabikes < ActiveRecord::Migration[5.1]
  def change
    add_column :aquabikes, :periode, :string
  end
end

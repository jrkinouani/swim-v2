class AddNbpersToAquabikes < ActiveRecord::Migration[5.1]
  def change
    add_column :aquabikes, :nbpers, :integer
  end
end

class AddNbseancesToAquabikes < ActiveRecord::Migration[5.1]
  def change
    add_column :aquabikes, :nbseances, :integer
  end
end

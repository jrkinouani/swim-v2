class AddResourceTypeToSelectedResa < ActiveRecord::Migration[5.1]
  def change
    add_column :selected_resas, :resource_type, :string
  end
end

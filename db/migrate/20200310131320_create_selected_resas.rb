class CreateSelectedResas < ActiveRecord::Migration[5.1]
  def change
    create_table :selected_resas do |t|
      t.datetime :date
      t.integer :resource_id
      t.references :user
      t.string :title

      t.timestamps
    end
  end
end

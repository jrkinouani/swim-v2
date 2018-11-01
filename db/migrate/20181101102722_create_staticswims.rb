class CreateStaticswims < ActiveRecord::Migration[5.1]
  def change
    create_table :staticswims do |t|
      t.string :title
      t.integer :price
      t.integer :nbpers
      t.integer :nbseance
      t.string :periode
      t.string :duree

      t.timestamps
    end
  end
end

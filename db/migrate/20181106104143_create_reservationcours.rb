class CreateReservationcours < ActiveRecord::Migration[5.1]
  def change
    create_table :reservationcours do |t|
      t.integer :price
      t.date :start
      t.string :phone
      t.string :name
      t.string :creneau
      t.references :aquaparcour, foreign_key: true

      t.timestamps
    end
  end
end

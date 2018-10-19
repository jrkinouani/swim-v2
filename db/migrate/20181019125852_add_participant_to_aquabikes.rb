class AddParticipantToAquabikes < ActiveRecord::Migration[5.1]
  def change
    add_column :aquabikes, :participant, :string
  end
end

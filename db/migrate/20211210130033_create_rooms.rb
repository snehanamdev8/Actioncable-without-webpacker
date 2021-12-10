class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :sender_id
      t.integer :receiver_id
      t.timestamps
    end
  end
end

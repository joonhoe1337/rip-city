class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.integer :room_id
      t.integer :room_type
      t.integer :status

      t.timestamps
    end
  end
end

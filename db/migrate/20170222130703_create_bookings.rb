class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.datetime :checkin_date
      t.datetime :checkout_date
      t.integer :room_type
      t.integer :room_no
      t.integer :adult_no
      t.integer :child_no
      t.string :name
      t.string :email
      t.string :address
      t.string :comment
      t.integer :status

      t.timestamps
    end
  end
end

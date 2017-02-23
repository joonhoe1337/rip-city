class AddReservationIdToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :reservation_id, :string
  end
end

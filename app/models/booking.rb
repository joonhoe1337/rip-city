class Booking < ApplicationRecord
  enum room_type: [ :single, :double, :triple, :luxury ]
  enum status: [ :reserved, :checkin, :checkout ]
end

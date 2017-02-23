class Booking < ApplicationRecord
  enum room_type: [ :single, :double, :triple, :luxury ]
  enum status: [ :reserve, :cancel, :paid ]
end

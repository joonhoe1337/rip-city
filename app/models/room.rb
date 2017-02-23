class Room < ApplicationRecord
  enum room_type: [ :single, :double, :triple, :luxury ]
  enum status: [ :available, :check_in ]
  
  validates :room_id, presence: true, uniqueness: true
end

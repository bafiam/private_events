class User < ApplicationRecord
  has_many :events, class_name: "Event", foreign_key:"user_id"
  has_many :bookings, class_name: "Booking", foreign_key: "user_id"
  has_many :events,through: :bookings, source: :event
end

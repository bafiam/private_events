class Event < ApplicationRecord
  belongs_to :user, class_name: "User"
  has_many :bookings, class_name: "Booking", foreign_key: "event_id"
  has_many :users, through: :bookings, source: :user
end

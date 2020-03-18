class Event < ApplicationRecord
  belongs_to :user, class_name: "User", optional: true
  has_many :bookings, class_name: "Booking", foreign_key: "event_id"
  has_many :users, through: :bookings, source: :user
  belongs_to :creator, class_name: "User", optional: true
end

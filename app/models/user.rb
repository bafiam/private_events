class User < ApplicationRecord
  has_many :events, foreign_key: "creator_id", class_name: "Event"
  has_many :bookings, foreign_key: "attendee_id"
  has_many :attended_events,through: :bookings, source: :attended_event
end

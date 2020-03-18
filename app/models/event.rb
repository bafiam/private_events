class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", optional: true
  has_many :bookings, foreign_key: "attended_event_id"
  has_many :attendees, through: :bookings, source: :attendee
end

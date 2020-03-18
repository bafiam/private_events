class Booking < ApplicationRecord
  belongs_to :user, class_name: "User", optional: true
  belongs_to :event, class_name: "Event", optional: true
end

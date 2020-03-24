class AddAttendeeAndAttendedEventToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :attendee_id, :integer
    add_column :bookings, :attended_event_id, :integer
  end
end

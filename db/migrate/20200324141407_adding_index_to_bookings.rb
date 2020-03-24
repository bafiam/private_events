class AddingIndexToBookings < ActiveRecord::Migration[6.0]
  def change
    add_index :bookings, :attendee_id
    add_index :bookings, :attended_event_id
  end
end

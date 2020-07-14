class AddIndexToBookings < ActiveRecord::Migration[6.0]
  def change
    add_index :bookings, [:user_id, :event_id]
  end
end

require 'rails_helper'

RSpec.describe Booking, type: :model do
  context "should belong to the" do
    it "attendee" do
      should belong_to(:attendee).class_name('User')
     
    end
    it "attended_event" do
      should belong_to(:attended_event).class_name('Event')
     
    end
  end

  context "should have specific column. It has" do
    it "a created_at column of datetime"  do
      should have_db_column(:created_at).of_type(:datetime).
      with_options(precision: 6, null: false)
    end
    it "a updated_at column of datetime" do
      should have_db_column(:updated_at).of_type(:datetime).
      with_options(precision: 6, null: false)
    end
    it "a attendee_id column of integer"  do
      should have_db_column(:attendee_id).of_type(:integer)
    end
    it "a attended_event_id column of integer"  do
      should have_db_column(:attended_event_id).of_type(:integer)
    end
    
  end
  
end

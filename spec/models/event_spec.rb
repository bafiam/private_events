require 'rails_helper'

RSpec.describe Event, type: :model do
  context "should have 'has_many' relationship " do
    it "with bookings"  do
      should have_many(:bookings).with_foreign_key('attended_event_id')
    end

    it "with attendees" do
      should have_many(:attendees).through(:bookings).
      source(:attendee)
    end
    
  end
  context "should belong to the" do
    it "creator" do
      should belong_to(:creator).class_name('User').optional
     
    end
  end
  

  context "should have specific column. It has" do

    it "a name column of string"  do
      should have_db_column(:name).of_type(:string)
    end
    it "a description column of text"  do
      should have_db_column(:description).of_type(:text)
    end
    it "a location column of string"  do
      should have_db_column(:location).of_type(:string)
    end
    it "a fees column of integer"  do
      should have_db_column(:fees).of_type(:integer)
    end
    it "a user_id column of integer"  do
      should have_db_column(:user_id).of_type(:integer)
    end
    it "a created_at column of datetime"  do
      should have_db_column(:created_at).of_type(:datetime).
      with_options(precision: 6, null: false)
    end
    it "a updated_at column of datetime" do
      should have_db_column(:updated_at).of_type(:datetime).
      with_options(precision: 6, null: false)
    end
    it "a date column of datetime"  do
      should have_db_column(:date).of_type(:datetime)
    end
    it "a creator_id column of integer"  do
      should have_db_column(:creator_id).of_type(:integer)
    end

  end
end

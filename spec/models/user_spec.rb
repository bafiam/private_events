require 'rails_helper'

RSpec.describe User, type: :model do
  let(:name_one) { "stephen" } 
  let(:email_one) { "stephen@gmail.com" }
  let(:user) { User.create(name:name_one, email:email_one) }  
  it "accepts both name and email data fields to be valid" do
    expect(user).to be_valid
  end
  it "should return the name and email of user" do
    user.save
    fetch_user = User.find_by(name:name_one)
    expect(fetch_user.name).to eql name_one
    expect(fetch_user.email).to eql email_one
  end

  context "should have 'has_many' relationship " do
    it "with events" do
      should have_many(:events).class_name('Event').with_foreign_key('creator_id')
    end

    it "with bookings"  do
      should have_many(:bookings).with_foreign_key('attendee_id')
    end

    it "with attended_events" do
      should have_many(:attended_events).through(:bookings).
      source(:attended_event)
    end
    
  end

  context "should have specific column. It has" do

    it "a name column of string"  do
      should have_db_column(:name).of_type(:string)
    end
    it "a email column of email"  do
      should have_db_column(:email).of_type(:string)
    end
    it "a created_at column of datetime"  do
      should have_db_column(:created_at).of_type(:datetime).
      with_options(precision: 6, null: false)
    end
    it "a updated_at column of datetime"  do
      should have_db_column(:updated_at).of_type(:datetime).
      with_options(precision: 6, null: false)
    end

    
  end
  
  
end

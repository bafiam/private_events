require "rails_helper"

RSpec.describe "App routes to", :type => :routing do
  it "the new booking controller" do
    expect(get("/invite")).
      to route_to("bookings#new")
  end
  it "the create booking controller" do
    expect(post("/invite")).
      to route_to("bookings#create")
  end
  it "the user create account controller" do
    expect(get("/invite")).
      to route_to("bookings#new")
  end
  it "the create new user account controller" do
    expect(get("/signup")).
      to route_to("users#new")
  end
  it "the create user account controller" do
    expect(post("/signup")).
      to route_to("users#create")
  end
  it "the user login controller" do
    expect(get("/login")).
      to route_to("sessions#new")
  end
  it "the user login controller" do
    expect(post("/login")).
      to route_to("sessions#create")
  end
  it "the user log out controller" do
    expect(delete("/logout")).
      to route_to("sessions#destroy")
  end
end
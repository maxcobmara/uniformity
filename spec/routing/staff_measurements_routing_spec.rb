require "spec_helper"

describe StaffMeasurementsController do
  describe "routing" do

    it "routes to #index" do
      get("/staff_measurements").should route_to("staff_measurements#index")
    end

    it "routes to #new" do
      get("/staff_measurements/new").should route_to("staff_measurements#new")
    end

    it "routes to #show" do
      get("/staff_measurements/1").should route_to("staff_measurements#show", :id => "1")
    end

    it "routes to #edit" do
      get("/staff_measurements/1/edit").should route_to("staff_measurements#edit", :id => "1")
    end

    it "routes to #create" do
      post("/staff_measurements").should route_to("staff_measurements#create")
    end

    it "routes to #update" do
      put("/staff_measurements/1").should route_to("staff_measurements#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/staff_measurements/1").should route_to("staff_measurements#destroy", :id => "1")
    end

  end
end

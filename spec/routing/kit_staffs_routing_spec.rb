require "spec_helper"

describe KitStaffsController do
  describe "routing" do

    it "routes to #index" do
      get("/kit_staffs").should route_to("kit_staffs#index")
    end

    it "routes to #new" do
      get("/kit_staffs/new").should route_to("kit_staffs#new")
    end

    it "routes to #show" do
      get("/kit_staffs/1").should route_to("kit_staffs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/kit_staffs/1/edit").should route_to("kit_staffs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/kit_staffs").should route_to("kit_staffs#create")
    end

    it "routes to #update" do
      put("/kit_staffs/1").should route_to("kit_staffs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/kit_staffs/1").should route_to("kit_staffs#destroy", :id => "1")
    end

  end
end

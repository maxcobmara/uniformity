require "spec_helper"

describe KitsController do
  describe "routing" do

    it "routes to #index" do
      get("/kits").should route_to("kits#index")
    end

    it "routes to #new" do
      get("/kits/new").should route_to("kits#new")
    end

    it "routes to #show" do
      get("/kits/1").should route_to("kits#show", :id => "1")
    end

    it "routes to #edit" do
      get("/kits/1/edit").should route_to("kits#edit", :id => "1")
    end

    it "routes to #create" do
      post("/kits").should route_to("kits#create")
    end

    it "routes to #update" do
      put("/kits/1").should route_to("kits#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/kits/1").should route_to("kits#destroy", :id => "1")
    end

  end
end

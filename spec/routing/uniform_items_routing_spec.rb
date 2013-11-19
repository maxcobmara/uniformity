require "spec_helper"

describe UniformItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/uniform_items").should route_to("uniform_items#index")
    end

    it "routes to #new" do
      get("/uniform_items/new").should route_to("uniform_items#new")
    end

    it "routes to #show" do
      get("/uniform_items/1").should route_to("uniform_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/uniform_items/1/edit").should route_to("uniform_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/uniform_items").should route_to("uniform_items#create")
    end

    it "routes to #update" do
      put("/uniform_items/1").should route_to("uniform_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/uniform_items/1").should route_to("uniform_items#destroy", :id => "1")
    end

  end
end

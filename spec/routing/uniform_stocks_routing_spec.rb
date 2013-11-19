require "spec_helper"

describe UniformStocksController do
  describe "routing" do

    it "routes to #index" do
      get("/uniform_stocks").should route_to("uniform_stocks#index")
    end

    it "routes to #new" do
      get("/uniform_stocks/new").should route_to("uniform_stocks#new")
    end

    it "routes to #show" do
      get("/uniform_stocks/1").should route_to("uniform_stocks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/uniform_stocks/1/edit").should route_to("uniform_stocks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/uniform_stocks").should route_to("uniform_stocks#create")
    end

    it "routes to #update" do
      put("/uniform_stocks/1").should route_to("uniform_stocks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/uniform_stocks/1").should route_to("uniform_stocks#destroy", :id => "1")
    end

  end
end

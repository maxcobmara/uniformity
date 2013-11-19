require "spec_helper"

describe UniformStockReceivedsController do
  describe "routing" do

    it "routes to #index" do
      get("/uniform_stock_receiveds").should route_to("uniform_stock_receiveds#index")
    end

    it "routes to #new" do
      get("/uniform_stock_receiveds/new").should route_to("uniform_stock_receiveds#new")
    end

    it "routes to #show" do
      get("/uniform_stock_receiveds/1").should route_to("uniform_stock_receiveds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/uniform_stock_receiveds/1/edit").should route_to("uniform_stock_receiveds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/uniform_stock_receiveds").should route_to("uniform_stock_receiveds#create")
    end

    it "routes to #update" do
      put("/uniform_stock_receiveds/1").should route_to("uniform_stock_receiveds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/uniform_stock_receiveds/1").should route_to("uniform_stock_receiveds#destroy", :id => "1")
    end

  end
end

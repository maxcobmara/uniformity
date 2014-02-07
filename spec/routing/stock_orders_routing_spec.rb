require "spec_helper"

describe StockOrdersController do
  describe "routing" do

    it "routes to #index" do
      get("/stock_orders").should route_to("stock_orders#index")
    end

    it "routes to #new" do
      get("/stock_orders/new").should route_to("stock_orders#new")
    end

    it "routes to #show" do
      get("/stock_orders/1").should route_to("stock_orders#show", :id => "1")
    end

    it "routes to #edit" do
      get("/stock_orders/1/edit").should route_to("stock_orders#edit", :id => "1")
    end

    it "routes to #create" do
      post("/stock_orders").should route_to("stock_orders#create")
    end

    it "routes to #update" do
      put("/stock_orders/1").should route_to("stock_orders#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/stock_orders/1").should route_to("stock_orders#destroy", :id => "1")
    end

  end
end

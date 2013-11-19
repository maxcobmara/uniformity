require "spec_helper"

describe UniformStockIssuesController do
  describe "routing" do

    it "routes to #index" do
      get("/uniform_stock_issues").should route_to("uniform_stock_issues#index")
    end

    it "routes to #new" do
      get("/uniform_stock_issues/new").should route_to("uniform_stock_issues#new")
    end

    it "routes to #show" do
      get("/uniform_stock_issues/1").should route_to("uniform_stock_issues#show", :id => "1")
    end

    it "routes to #edit" do
      get("/uniform_stock_issues/1/edit").should route_to("uniform_stock_issues#edit", :id => "1")
    end

    it "routes to #create" do
      post("/uniform_stock_issues").should route_to("uniform_stock_issues#create")
    end

    it "routes to #update" do
      put("/uniform_stock_issues/1").should route_to("uniform_stock_issues#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/uniform_stock_issues/1").should route_to("uniform_stock_issues#destroy", :id => "1")
    end

  end
end

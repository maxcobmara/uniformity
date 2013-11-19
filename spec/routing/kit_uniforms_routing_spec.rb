require "spec_helper"

describe KitUniformsController do
  describe "routing" do

    it "routes to #index" do
      get("/kit_uniforms").should route_to("kit_uniforms#index")
    end

    it "routes to #new" do
      get("/kit_uniforms/new").should route_to("kit_uniforms#new")
    end

    it "routes to #show" do
      get("/kit_uniforms/1").should route_to("kit_uniforms#show", :id => "1")
    end

    it "routes to #edit" do
      get("/kit_uniforms/1/edit").should route_to("kit_uniforms#edit", :id => "1")
    end

    it "routes to #create" do
      post("/kit_uniforms").should route_to("kit_uniforms#create")
    end

    it "routes to #update" do
      put("/kit_uniforms/1").should route_to("kit_uniforms#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/kit_uniforms/1").should route_to("kit_uniforms#destroy", :id => "1")
    end

  end
end

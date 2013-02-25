require "spec_helper"

describe RegistrarsController do
  describe "routing" do

    it "routes to #index" do
      get("/registrars").should route_to("registrars#index")
    end

    it "routes to #new" do
      get("/registrars/new").should route_to("registrars#new")
    end

    it "routes to #show" do
      get("/registrars/1").should route_to("registrars#show", :id => "1")
    end

    it "routes to #edit" do
      get("/registrars/1/edit").should route_to("registrars#edit", :id => "1")
    end

    it "routes to #create" do
      post("/registrars").should route_to("registrars#create")
    end

    it "routes to #update" do
      put("/registrars/1").should route_to("registrars#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/registrars/1").should route_to("registrars#destroy", :id => "1")
    end

  end
end

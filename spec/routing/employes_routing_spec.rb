require "rails_helper"

RSpec.describe EmployesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/employes").to route_to("employes#index")
    end

    it "routes to #new" do
      expect(:get => "/employes/new").to route_to("employes#new")
    end

    it "routes to #show" do
      expect(:get => "/employes/1").to route_to("employes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/employes/1/edit").to route_to("employes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/employes").to route_to("employes#create")
    end

    it "routes to #update" do
      expect(:put => "/employes/1").to route_to("employes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/employes/1").to route_to("employes#destroy", :id => "1")
    end

  end
end

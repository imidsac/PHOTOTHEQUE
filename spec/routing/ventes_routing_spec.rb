require "rails_helper"

RSpec.describe VentesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/ventes").to route_to("ventes#index")
    end

    it "routes to #new" do
      expect(:get => "/ventes/new").to route_to("ventes#new")
    end

    it "routes to #show" do
      expect(:get => "/ventes/1").to route_to("ventes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/ventes/1/edit").to route_to("ventes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/ventes").to route_to("ventes#create")
    end

    it "routes to #update" do
      expect(:put => "/ventes/1").to route_to("ventes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ventes/1").to route_to("ventes#destroy", :id => "1")
    end

  end
end

require "rails_helper"

RSpec.describe CaissesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/caisses").to route_to("caisses#index")
    end

    it "routes to #new" do
      expect(:get => "/caisses/new").to route_to("caisses#new")
    end

    it "routes to #show" do
      expect(:get => "/caisses/1").to route_to("caisses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/caisses/1/edit").to route_to("caisses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/caisses").to route_to("caisses#create")
    end

    it "routes to #update" do
      expect(:put => "/caisses/1").to route_to("caisses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/caisses/1").to route_to("caisses#destroy", :id => "1")
    end

  end
end

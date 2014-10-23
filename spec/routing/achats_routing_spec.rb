require "rails_helper"

RSpec.describe AchatsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/achats").to route_to("achats#index")
    end

    it "routes to #new" do
      expect(:get => "/achats/new").to route_to("achats#new")
    end

    it "routes to #show" do
      expect(:get => "/achats/1").to route_to("achats#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/achats/1/edit").to route_to("achats#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/achats").to route_to("achats#create")
    end

    it "routes to #update" do
      expect(:put => "/achats/1").to route_to("achats#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/achats/1").to route_to("achats#destroy", :id => "1")
    end

  end
end

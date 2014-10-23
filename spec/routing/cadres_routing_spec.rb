require "rails_helper"

RSpec.describe CadresController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/cadres").to route_to("cadres#index")
    end

    it "routes to #new" do
      expect(:get => "/cadres/new").to route_to("cadres#new")
    end

    it "routes to #show" do
      expect(:get => "/cadres/1").to route_to("cadres#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/cadres/1/edit").to route_to("cadres#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/cadres").to route_to("cadres#create")
    end

    it "routes to #update" do
      expect(:put => "/cadres/1").to route_to("cadres#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/cadres/1").to route_to("cadres#destroy", :id => "1")
    end

  end
end

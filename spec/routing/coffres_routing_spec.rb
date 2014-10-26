require "rails_helper"

RSpec.describe CoffresController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/coffres").to route_to("coffres#index")
    end

    it "routes to #new" do
      expect(:get => "/coffres/new").to route_to("coffres#new")
    end

    it "routes to #show" do
      expect(:get => "/coffres/1").to route_to("coffres#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/coffres/1/edit").to route_to("coffres#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/coffres").to route_to("coffres#create")
    end

    it "routes to #update" do
      expect(:put => "/coffres/1").to route_to("coffres#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/coffres/1").to route_to("coffres#destroy", :id => "1")
    end

  end
end

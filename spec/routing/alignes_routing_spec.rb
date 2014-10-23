require "rails_helper"

RSpec.describe AlignesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/alignes").to route_to("alignes#index")
    end

    it "routes to #new" do
      expect(:get => "/alignes/new").to route_to("alignes#new")
    end

    it "routes to #show" do
      expect(:get => "/alignes/1").to route_to("alignes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/alignes/1/edit").to route_to("alignes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/alignes").to route_to("alignes#create")
    end

    it "routes to #update" do
      expect(:put => "/alignes/1").to route_to("alignes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/alignes/1").to route_to("alignes#destroy", :id => "1")
    end

  end
end

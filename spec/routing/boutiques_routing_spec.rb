require "rails_helper"

RSpec.describe BoutiquesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/boutiques").to route_to("boutiques#index")
    end

    it "routes to #new" do
      expect(:get => "/boutiques/new").to route_to("boutiques#new")
    end

    it "routes to #show" do
      expect(:get => "/boutiques/1").to route_to("boutiques#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/boutiques/1/edit").to route_to("boutiques#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/boutiques").to route_to("boutiques#create")
    end

    it "routes to #update" do
      expect(:put => "/boutiques/1").to route_to("boutiques#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/boutiques/1").to route_to("boutiques#destroy", :id => "1")
    end

  end
end

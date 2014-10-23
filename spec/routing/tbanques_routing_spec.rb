require "rails_helper"

RSpec.describe TbanquesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tbanques").to route_to("tbanques#index")
    end

    it "routes to #new" do
      expect(:get => "/tbanques/new").to route_to("tbanques#new")
    end

    it "routes to #show" do
      expect(:get => "/tbanques/1").to route_to("tbanques#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tbanques/1/edit").to route_to("tbanques#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tbanques").to route_to("tbanques#create")
    end

    it "routes to #update" do
      expect(:put => "/tbanques/1").to route_to("tbanques#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tbanques/1").to route_to("tbanques#destroy", :id => "1")
    end

  end
end

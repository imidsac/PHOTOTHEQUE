require "rails_helper"

RSpec.describe TcoffresController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tcoffres").to route_to("tcoffres#index")
    end

    it "routes to #new" do
      expect(:get => "/tcoffres/new").to route_to("tcoffres#new")
    end

    it "routes to #show" do
      expect(:get => "/tcoffres/1").to route_to("tcoffres#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tcoffres/1/edit").to route_to("tcoffres#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tcoffres").to route_to("tcoffres#create")
    end

    it "routes to #update" do
      expect(:put => "/tcoffres/1").to route_to("tcoffres#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tcoffres/1").to route_to("tcoffres#destroy", :id => "1")
    end

  end
end

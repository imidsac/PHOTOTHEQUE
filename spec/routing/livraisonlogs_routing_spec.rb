require "rails_helper"

RSpec.describe LivraisonlogsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/livraisonlogs").to route_to("livraisonlogs#index")
    end

    it "routes to #new" do
      expect(:get => "/livraisonlogs/new").to route_to("livraisonlogs#new")
    end

    it "routes to #show" do
      expect(:get => "/livraisonlogs/1").to route_to("livraisonlogs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/livraisonlogs/1/edit").to route_to("livraisonlogs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/livraisonlogs").to route_to("livraisonlogs#create")
    end

    it "routes to #update" do
      expect(:put => "/livraisonlogs/1").to route_to("livraisonlogs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/livraisonlogs/1").to route_to("livraisonlogs#destroy", :id => "1")
    end

  end
end

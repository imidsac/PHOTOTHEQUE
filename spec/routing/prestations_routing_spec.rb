require "rails_helper"

RSpec.describe PrestationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/prestations").to route_to("prestations#index")
    end

    it "routes to #new" do
      expect(:get => "/prestations/new").to route_to("prestations#new")
    end

    it "routes to #show" do
      expect(:get => "/prestations/1").to route_to("prestations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/prestations/1/edit").to route_to("prestations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/prestations").to route_to("prestations#create")
    end

    it "routes to #update" do
      expect(:put => "/prestations/1").to route_to("prestations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/prestations/1").to route_to("prestations#destroy", :id => "1")
    end

  end
end

require "rails_helper"

RSpec.describe MonetairesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/monetaires").to route_to("monetaires#index")
    end

    it "routes to #new" do
      expect(:get => "/monetaires/new").to route_to("monetaires#new")
    end

    it "routes to #show" do
      expect(:get => "/monetaires/1").to route_to("monetaires#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/monetaires/1/edit").to route_to("monetaires#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/monetaires").to route_to("monetaires#create")
    end

    it "routes to #update" do
      expect(:put => "/monetaires/1").to route_to("monetaires#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/monetaires/1").to route_to("monetaires#destroy", :id => "1")
    end

  end
end

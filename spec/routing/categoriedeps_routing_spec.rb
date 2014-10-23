require "rails_helper"

RSpec.describe CategoriedepsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/categoriedeps").to route_to("categoriedeps#index")
    end

    it "routes to #new" do
      expect(:get => "/categoriedeps/new").to route_to("categoriedeps#new")
    end

    it "routes to #show" do
      expect(:get => "/categoriedeps/1").to route_to("categoriedeps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/categoriedeps/1/edit").to route_to("categoriedeps#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/categoriedeps").to route_to("categoriedeps#create")
    end

    it "routes to #update" do
      expect(:put => "/categoriedeps/1").to route_to("categoriedeps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/categoriedeps/1").to route_to("categoriedeps#destroy", :id => "1")
    end

  end
end

require "rails_helper"

RSpec.describe PrestationlignesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/prestationlignes").to route_to("prestationlignes#index")
    end

    it "routes to #new" do
      expect(:get => "/prestationlignes/new").to route_to("prestationlignes#new")
    end

    it "routes to #show" do
      expect(:get => "/prestationlignes/1").to route_to("prestationlignes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/prestationlignes/1/edit").to route_to("prestationlignes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/prestationlignes").to route_to("prestationlignes#create")
    end

    it "routes to #update" do
      expect(:put => "/prestationlignes/1").to route_to("prestationlignes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/prestationlignes/1").to route_to("prestationlignes#destroy", :id => "1")
    end

  end
end

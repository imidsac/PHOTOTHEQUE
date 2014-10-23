require "rails_helper"

RSpec.describe VentelignesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/ventelignes").to route_to("ventelignes#index")
    end

    it "routes to #new" do
      expect(:get => "/ventelignes/new").to route_to("ventelignes#new")
    end

    it "routes to #show" do
      expect(:get => "/ventelignes/1").to route_to("ventelignes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/ventelignes/1/edit").to route_to("ventelignes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/ventelignes").to route_to("ventelignes#create")
    end

    it "routes to #update" do
      expect(:put => "/ventelignes/1").to route_to("ventelignes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ventelignes/1").to route_to("ventelignes#destroy", :id => "1")
    end

  end
end

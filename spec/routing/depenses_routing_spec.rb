require "rails_helper"

RSpec.describe DepensesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/depenses").to route_to("depenses#index")
    end

    it "routes to #new" do
      expect(:get => "/depenses/new").to route_to("depenses#new")
    end

    it "routes to #show" do
      expect(:get => "/depenses/1").to route_to("depenses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/depenses/1/edit").to route_to("depenses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/depenses").to route_to("depenses#create")
    end

    it "routes to #update" do
      expect(:put => "/depenses/1").to route_to("depenses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/depenses/1").to route_to("depenses#destroy", :id => "1")
    end

  end
end

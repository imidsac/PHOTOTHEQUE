require "rails_helper"

RSpec.describe BanquesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/banques").to route_to("banques#index")
    end

    it "routes to #new" do
      expect(:get => "/banques/new").to route_to("banques#new")
    end

    it "routes to #show" do
      expect(:get => "/banques/1").to route_to("banques#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/banques/1/edit").to route_to("banques#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/banques").to route_to("banques#create")
    end

    it "routes to #update" do
      expect(:put => "/banques/1").to route_to("banques#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/banques/1").to route_to("banques#destroy", :id => "1")
    end

  end
end

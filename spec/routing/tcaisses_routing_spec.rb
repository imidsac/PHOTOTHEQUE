require "rails_helper"

RSpec.describe TcaissesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/tcaisses").to route_to("tcaisses#index")
    end

    it "routes to #new" do
      expect(:get => "/tcaisses/new").to route_to("tcaisses#new")
    end

    it "routes to #show" do
      expect(:get => "/tcaisses/1").to route_to("tcaisses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/tcaisses/1/edit").to route_to("tcaisses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/tcaisses").to route_to("tcaisses#create")
    end

    it "routes to #update" do
      expect(:put => "/tcaisses/1").to route_to("tcaisses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/tcaisses/1").to route_to("tcaisses#destroy", :id => "1")
    end

  end
end

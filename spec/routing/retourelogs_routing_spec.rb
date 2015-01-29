require "rails_helper"

RSpec.describe RetourelogsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/retourelogs").to route_to("retourelogs#index")
    end

    it "routes to #new" do
      expect(:get => "/retourelogs/new").to route_to("retourelogs#new")
    end

    it "routes to #show" do
      expect(:get => "/retourelogs/1").to route_to("retourelogs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/retourelogs/1/edit").to route_to("retourelogs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/retourelogs").to route_to("retourelogs#create")
    end

    it "routes to #update" do
      expect(:put => "/retourelogs/1").to route_to("retourelogs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/retourelogs/1").to route_to("retourelogs#destroy", :id => "1")
    end

  end
end

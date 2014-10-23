require "rails_helper"

RSpec.describe FournisseursController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/fournisseurs").to route_to("fournisseurs#index")
    end

    it "routes to #new" do
      expect(:get => "/fournisseurs/new").to route_to("fournisseurs#new")
    end

    it "routes to #show" do
      expect(:get => "/fournisseurs/1").to route_to("fournisseurs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/fournisseurs/1/edit").to route_to("fournisseurs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/fournisseurs").to route_to("fournisseurs#create")
    end

    it "routes to #update" do
      expect(:put => "/fournisseurs/1").to route_to("fournisseurs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/fournisseurs/1").to route_to("fournisseurs#destroy", :id => "1")
    end

  end
end

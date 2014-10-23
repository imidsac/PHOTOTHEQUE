require "rails_helper"

RSpec.describe FormatphotosController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/formatphotos").to route_to("formatphotos#index")
    end

    it "routes to #new" do
      expect(:get => "/formatphotos/new").to route_to("formatphotos#new")
    end

    it "routes to #show" do
      expect(:get => "/formatphotos/1").to route_to("formatphotos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/formatphotos/1/edit").to route_to("formatphotos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/formatphotos").to route_to("formatphotos#create")
    end

    it "routes to #update" do
      expect(:put => "/formatphotos/1").to route_to("formatphotos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/formatphotos/1").to route_to("formatphotos#destroy", :id => "1")
    end

  end
end

require "rails_helper"

RSpec.describe PrestationAttachmentsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/prestation_attachments").to route_to("prestation_attachments#index")
    end

    it "routes to #new" do
      expect(:get => "/prestation_attachments/new").to route_to("prestation_attachments#new")
    end

    it "routes to #show" do
      expect(:get => "/prestation_attachments/1").to route_to("prestation_attachments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/prestation_attachments/1/edit").to route_to("prestation_attachments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/prestation_attachments").to route_to("prestation_attachments#create")
    end

    it "routes to #update" do
      expect(:put => "/prestation_attachments/1").to route_to("prestation_attachments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/prestation_attachments/1").to route_to("prestation_attachments#destroy", :id => "1")
    end

  end
end

require "rails_helper"

RSpec.describe OptionretouresController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/optionretoures").to route_to("optionretoures#index")
    end

    it "routes to #new" do
      expect(:get => "/optionretoures/new").to route_to("optionretoures#new")
    end

    it "routes to #show" do
      expect(:get => "/optionretoures/1").to route_to("optionretoures#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/optionretoures/1/edit").to route_to("optionretoures#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/optionretoures").to route_to("optionretoures#create")
    end

    it "routes to #update" do
      expect(:put => "/optionretoures/1").to route_to("optionretoures#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/optionretoures/1").to route_to("optionretoures#destroy", :id => "1")
    end

  end
end

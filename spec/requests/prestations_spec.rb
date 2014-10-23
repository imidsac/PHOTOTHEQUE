require 'rails_helper'

RSpec.describe "Prestations", :type => :request do
  describe "GET /prestations" do
    it "works! (now write some real specs)" do
      get prestations_path
      expect(response).to have_http_status(200)
    end
  end
end

require 'rails_helper'

RSpec.describe "Paiements", :type => :request do
  describe "GET /paiements" do
    it "works! (now write some real specs)" do
      get paiements_path
      expect(response).to have_http_status(200)
    end
  end
end

require 'rails_helper'

RSpec.describe "Livraisonlogs", :type => :request do
  describe "GET /livraisonlogs" do
    it "works! (now write some real specs)" do
      get livraisonlogs_path
      expect(response).to have_http_status(200)
    end
  end
end

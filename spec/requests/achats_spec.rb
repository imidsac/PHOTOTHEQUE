require 'rails_helper'

RSpec.describe "Achats", :type => :request do
  describe "GET /achats" do
    it "works! (now write some real specs)" do
      get achats_path
      expect(response).to have_http_status(200)
    end
  end
end

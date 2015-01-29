require 'rails_helper'

RSpec.describe "Retourelogs", :type => :request do
  describe "GET /retourelogs" do
    it "works! (now write some real specs)" do
      get retourelogs_path
      expect(response).to have_http_status(200)
    end
  end
end

require 'rails_helper'

RSpec.describe "Boutiques", :type => :request do
  describe "GET /boutiques" do
    it "works! (now write some real specs)" do
      get boutiques_path
      expect(response).to have_http_status(200)
    end
  end
end

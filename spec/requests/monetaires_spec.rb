require 'rails_helper'

RSpec.describe "Monetaires", :type => :request do
  describe "GET /monetaires" do
    it "works! (now write some real specs)" do
      get monetaires_path
      expect(response).to have_http_status(200)
    end
  end
end

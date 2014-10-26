require 'rails_helper'

RSpec.describe "Coffres", :type => :request do
  describe "GET /coffres" do
    it "works! (now write some real specs)" do
      get coffres_path
      expect(response).to have_http_status(200)
    end
  end
end

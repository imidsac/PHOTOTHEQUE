require 'rails_helper'

RSpec.describe "Tcaisses", :type => :request do
  describe "GET /tcaisses" do
    it "works! (now write some real specs)" do
      get tcaisses_path
      expect(response).to have_http_status(200)
    end
  end
end

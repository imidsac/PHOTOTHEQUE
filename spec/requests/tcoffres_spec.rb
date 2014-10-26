require 'rails_helper'

RSpec.describe "Tcoffres", :type => :request do
  describe "GET /tcoffres" do
    it "works! (now write some real specs)" do
      get tcoffres_path
      expect(response).to have_http_status(200)
    end
  end
end

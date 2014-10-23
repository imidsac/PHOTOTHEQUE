require 'rails_helper'

RSpec.describe "Caisses", :type => :request do
  describe "GET /caisses" do
    it "works! (now write some real specs)" do
      get caisses_path
      expect(response).to have_http_status(200)
    end
  end
end

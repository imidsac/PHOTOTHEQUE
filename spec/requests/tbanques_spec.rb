require 'rails_helper'

RSpec.describe "Tbanques", :type => :request do
  describe "GET /tbanques" do
    it "works! (now write some real specs)" do
      get tbanques_path
      expect(response).to have_http_status(200)
    end
  end
end

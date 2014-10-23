require 'rails_helper'

RSpec.describe "Prestationlignes", :type => :request do
  describe "GET /prestationlignes" do
    it "works! (now write some real specs)" do
      get prestationlignes_path
      expect(response).to have_http_status(200)
    end
  end
end

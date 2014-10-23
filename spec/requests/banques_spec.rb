require 'rails_helper'

RSpec.describe "Banques", :type => :request do
  describe "GET /banques" do
    it "works! (now write some real specs)" do
      get banques_path
      expect(response).to have_http_status(200)
    end
  end
end

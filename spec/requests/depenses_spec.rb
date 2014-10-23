require 'rails_helper'

RSpec.describe "Depenses", :type => :request do
  describe "GET /depenses" do
    it "works! (now write some real specs)" do
      get depenses_path
      expect(response).to have_http_status(200)
    end
  end
end

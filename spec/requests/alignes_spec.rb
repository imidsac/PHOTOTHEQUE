require 'rails_helper'

RSpec.describe "Alignes", :type => :request do
  describe "GET /alignes" do
    it "works! (now write some real specs)" do
      get alignes_path
      expect(response).to have_http_status(200)
    end
  end
end

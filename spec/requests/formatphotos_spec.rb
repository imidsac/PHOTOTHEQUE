require 'rails_helper'

RSpec.describe "Formatphotos", :type => :request do
  describe "GET /formatphotos" do
    it "works! (now write some real specs)" do
      get formatphotos_path
      expect(response).to have_http_status(200)
    end
  end
end

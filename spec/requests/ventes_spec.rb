require 'rails_helper'

RSpec.describe "Ventes", :type => :request do
  describe "GET /ventes" do
    it "works! (now write some real specs)" do
      get ventes_path
      expect(response).to have_http_status(200)
    end
  end
end

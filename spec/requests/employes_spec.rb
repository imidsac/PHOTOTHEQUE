require 'rails_helper'

RSpec.describe "Employes", :type => :request do
  describe "GET /employes" do
    it "works! (now write some real specs)" do
      get employes_path
      expect(response).to have_http_status(200)
    end
  end
end

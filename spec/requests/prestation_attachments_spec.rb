require 'rails_helper'

RSpec.describe "PrestationAttachments", :type => :request do
  describe "GET /prestation_attachments" do
    it "works! (now write some real specs)" do
      get prestation_attachments_path
      expect(response).to have_http_status(200)
    end
  end
end

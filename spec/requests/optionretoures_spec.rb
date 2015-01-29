require 'rails_helper'

RSpec.describe "Optionretoures", :type => :request do
  describe "GET /optionretoures" do
    it "works! (now write some real specs)" do
      get optionretoures_path
      expect(response).to have_http_status(200)
    end
  end
end

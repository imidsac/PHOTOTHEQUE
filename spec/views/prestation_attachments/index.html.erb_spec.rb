require 'rails_helper'

RSpec.describe "prestation_attachments/index", :type => :view do
  before(:each) do
    assign(:prestation_attachments, [
      PrestationAttachment.create!(
        :prestation => nil,
        :photo => "Photo"
      ),
      PrestationAttachment.create!(
        :prestation => nil,
        :photo => "Photo"
      )
    ])
  end

  it "renders a list of prestation_attachments" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Photo".to_s, :count => 2
  end
end

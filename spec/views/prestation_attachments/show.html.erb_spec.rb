require 'rails_helper'

RSpec.describe "prestation_attachments/show", :type => :view do
  before(:each) do
    @prestation_attachment = assign(:prestation_attachment, PrestationAttachment.create!(
      :prestation => nil,
      :photo => "Photo"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Photo/)
  end
end

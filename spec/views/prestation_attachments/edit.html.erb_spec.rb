require 'rails_helper'

RSpec.describe "prestation_attachments/edit", :type => :view do
  before(:each) do
    @prestation_attachment = assign(:prestation_attachment, PrestationAttachment.create!(
      :prestation => nil,
      :photo => "MyString"
    ))
  end

  it "renders the edit prestation_attachment form" do
    render

    assert_select "form[action=?][method=?]", prestation_attachment_path(@prestation_attachment), "post" do

      assert_select "input#prestation_attachment_prestation_id[name=?]", "prestation_attachment[prestation_id]"

      assert_select "input#prestation_attachment_photo[name=?]", "prestation_attachment[photo]"
    end
  end
end

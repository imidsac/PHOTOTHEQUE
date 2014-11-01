require 'rails_helper'

RSpec.describe "prestation_attachments/new", :type => :view do
  before(:each) do
    assign(:prestation_attachment, PrestationAttachment.new(
      :prestation => nil,
      :photo => "MyString"
    ))
  end

  it "renders new prestation_attachment form" do
    render

    assert_select "form[action=?][method=?]", prestation_attachments_path, "post" do

      assert_select "input#prestation_attachment_prestation_id[name=?]", "prestation_attachment[prestation_id]"

      assert_select "input#prestation_attachment_photo[name=?]", "prestation_attachment[photo]"
    end
  end
end

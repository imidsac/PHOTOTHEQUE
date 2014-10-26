require 'rails_helper'

RSpec.describe "coffres/new", :type => :view do
  before(:each) do
    assign(:coffre, Coffre.new(
      :paiement => "9.99",
      :font => "9.99"
    ))
  end

  it "renders new coffre form" do
    render

    assert_select "form[action=?][method=?]", coffres_path, "post" do

      assert_select "input#coffre_paiement[name=?]", "coffre[paiement]"

      assert_select "input#coffre_font[name=?]", "coffre[font]"
    end
  end
end

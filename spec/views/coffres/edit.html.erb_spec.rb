require 'rails_helper'

RSpec.describe "coffres/edit", :type => :view do
  before(:each) do
    @coffre = assign(:coffre, Coffre.create!(
      :paiement => "9.99",
      :font => "9.99"
    ))
  end

  it "renders the edit coffre form" do
    render

    assert_select "form[action=?][method=?]", coffre_path(@coffre), "post" do

      assert_select "input#coffre_paiement[name=?]", "coffre[paiement]"

      assert_select "input#coffre_font[name=?]", "coffre[font]"
    end
  end
end

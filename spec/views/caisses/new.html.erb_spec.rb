require 'rails_helper'

RSpec.describe "caisses/new", :type => :view do
  before(:each) do
    assign(:caisse, Caisse.new(
      :paiement => "9.99",
      :font => "9.99"
    ))
  end

  it "renders new caisse form" do
    render

    assert_select "form[action=?][method=?]", caisses_path, "post" do

      assert_select "input#caisse_paiement[name=?]", "caisse[paiement]"

      assert_select "input#caisse_font[name=?]", "caisse[font]"
    end
  end
end

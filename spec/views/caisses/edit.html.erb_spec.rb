require 'rails_helper'

RSpec.describe "caisses/edit", :type => :view do
  before(:each) do
    @caisse = assign(:caisse, Caisse.create!(
      :paiement => "9.99",
      :font => "9.99"
    ))
  end

  it "renders the edit caisse form" do
    render

    assert_select "form[action=?][method=?]", caisse_path(@caisse), "post" do

      assert_select "input#caisse_paiement[name=?]", "caisse[paiement]"

      assert_select "input#caisse_font[name=?]", "caisse[font]"
    end
  end
end

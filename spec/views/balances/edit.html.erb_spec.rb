require 'rails_helper'

RSpec.describe "balances/edit", :type => :view do
  before(:each) do
    @balance = assign(:balance, Balance.create!(
      :exercice => 1,
      :mois => 1,
      :achats => "9.99",
      :depenses => "9.99",
      :ventes => "9.99",
      :tva => "9.99"
    ))
  end

  it "renders the edit balance form" do
    render

    assert_select "form[action=?][method=?]", balance_path(@balance), "post" do

      assert_select "input#balance_exercice[name=?]", "balance[exercice]"

      assert_select "input#balance_mois[name=?]", "balance[mois]"

      assert_select "input#balance_achats[name=?]", "balance[achats]"

      assert_select "input#balance_depenses[name=?]", "balance[depenses]"

      assert_select "input#balance_ventes[name=?]", "balance[ventes]"

      assert_select "input#balance_tva[name=?]", "balance[tva]"
    end
  end
end

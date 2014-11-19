require 'rails_helper'

RSpec.describe "balances/new", :type => :view do
  before(:each) do
    assign(:balance, Balance.new(
      :exercice => 1,
      :mois => 1,
      :achats => "9.99",
      :depenses => "9.99",
      :ventes => "9.99",
      :tva => "9.99"
    ))
  end

  it "renders new balance form" do
    render

    assert_select "form[action=?][method=?]", balances_path, "post" do

      assert_select "input#balance_exercice[name=?]", "balance[exercice]"

      assert_select "input#balance_mois[name=?]", "balance[mois]"

      assert_select "input#balance_achats[name=?]", "balance[achats]"

      assert_select "input#balance_depenses[name=?]", "balance[depenses]"

      assert_select "input#balance_ventes[name=?]", "balance[ventes]"

      assert_select "input#balance_tva[name=?]", "balance[tva]"
    end
  end
end

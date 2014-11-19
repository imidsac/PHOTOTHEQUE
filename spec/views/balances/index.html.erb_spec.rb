require 'rails_helper'

RSpec.describe "balances/index", :type => :view do
  before(:each) do
    assign(:balances, [
      Balance.create!(
        :exercice => 1,
        :mois => 2,
        :achats => "9.99",
        :depenses => "9.99",
        :ventes => "9.99",
        :tva => "9.99"
      ),
      Balance.create!(
        :exercice => 1,
        :mois => 2,
        :achats => "9.99",
        :depenses => "9.99",
        :ventes => "9.99",
        :tva => "9.99"
      )
    ])
  end

  it "renders a list of balances" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end

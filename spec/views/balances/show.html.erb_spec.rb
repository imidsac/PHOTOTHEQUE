require 'rails_helper'

RSpec.describe "balances/show", :type => :view do
  before(:each) do
    @balance = assign(:balance, Balance.create!(
      :exercice => 1,
      :mois => 2,
      :achats => "9.99",
      :depenses => "9.99",
      :ventes => "9.99",
      :tva => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end

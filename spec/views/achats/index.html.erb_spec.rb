require 'rails_helper'

RSpec.describe "achats/index", :type => :view do
  before(:each) do
    assign(:achats, [
      Achat.create!(
        :fournisseur => nil,
        :type => "Type",
        :somme => "9.99",
        :payee => "9.99",
        :etat_achat => "Etat Achat"
      ),
      Achat.create!(
        :fournisseur => nil,
        :type => "Type",
        :somme => "9.99",
        :payee => "9.99",
        :etat_achat => "Etat Achat"
      )
    ])
  end

  it "renders a list of achats" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Etat Achat".to_s, :count => 2
  end
end

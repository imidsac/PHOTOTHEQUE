require 'rails_helper'

RSpec.describe "paiements/index", :type => :view do
  before(:each) do
    assign(:paiements, [
      Paiement.create!(
        :vente => nil,
        :client => nil,
        :achat => nil,
        :fournisseur => nil,
        :motif => "Motif",
        :montant => "9.99"
      ),
      Paiement.create!(
        :vente => nil,
        :client => nil,
        :achat => nil,
        :fournisseur => nil,
        :motif => "Motif",
        :montant => "9.99"
      )
    ])
  end

  it "renders a list of paiements" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Motif".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end

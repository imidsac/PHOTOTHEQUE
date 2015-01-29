require 'rails_helper'

RSpec.describe "livraisonlogs/index", :type => :view do
  before(:each) do
    assign(:livraisonlogs, [
      Livraisonlog.create!(
        :achat => nil,
        :produit => nil,
        :qte => "9.99",
        :vente => nil,
        :etat => "Etat",
        :user => nil
      ),
      Livraisonlog.create!(
        :achat => nil,
        :produit => nil,
        :qte => "9.99",
        :vente => nil,
        :etat => "Etat",
        :user => nil
      )
    ])
  end

  it "renders a list of livraisonlogs" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Etat".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

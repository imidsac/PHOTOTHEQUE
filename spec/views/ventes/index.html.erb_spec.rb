require 'rails_helper'

RSpec.describe "ventes/index", :type => :view do
  before(:each) do
    assign(:ventes, [
      Vente.create!(
        :boutique => nil,
        :client => nil,
        :clients => "Clients",
        :etat_vente => "Etat Vente",
        :somme => "9.99",
        :payee => "9.99",
        :type => "Type",
        :etat_vente => "Etat Vente"
      ),
      Vente.create!(
        :boutique => nil,
        :client => nil,
        :clients => "Clients",
        :etat_vente => "Etat Vente",
        :somme => "9.99",
        :payee => "9.99",
        :type => "Type",
        :etat_vente => "Etat Vente"
      )
    ])
  end

  it "renders a list of ventes" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Clients".to_s, :count => 2
    assert_select "tr>td", :text => "Etat Vente".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Etat Vente".to_s, :count => 2
  end
end

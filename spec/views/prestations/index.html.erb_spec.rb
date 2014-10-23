require 'rails_helper'

RSpec.describe "prestations/index", :type => :view do
  before(:each) do
    assign(:prestations, [
      Prestation.create!(
        :client => nil,
        :employe => nil,
        :etat_prestation => "Etat Prestation",
        :somme => "9.99",
        :payee => "9.99"
      ),
      Prestation.create!(
        :client => nil,
        :employe => nil,
        :etat_prestation => "Etat Prestation",
        :somme => "9.99",
        :payee => "9.99"
      )
    ])
  end

  it "renders a list of prestations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Etat Prestation".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end

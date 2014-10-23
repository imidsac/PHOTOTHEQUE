require 'rails_helper'

RSpec.describe "ventelignes/index", :type => :view do
  before(:each) do
    assign(:ventelignes, [
      Venteligne.create!(
        :vente => nil,
        :qte => "9.99",
        :qtelivre => "9.99",
        :montant => "9.99",
        :etat => "Etat"
      ),
      Venteligne.create!(
        :vente => nil,
        :qte => "9.99",
        :qtelivre => "9.99",
        :montant => "9.99",
        :etat => "Etat"
      )
    ])
  end

  it "renders a list of ventelignes" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Etat".to_s, :count => 2
  end
end

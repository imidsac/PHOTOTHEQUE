require 'rails_helper'

RSpec.describe "prestationlignes/index", :type => :view do
  before(:each) do
    assign(:prestationlignes, [
      Prestationligne.create!(
        :prestation => nil,
        :qte => "9.99",
        :qtelivre => "9.99",
        :montant => "9.99",
        :numero_prise => 1,
        :type => false,
        :etat => "Etat"
      ),
      Prestationligne.create!(
        :prestation => nil,
        :qte => "9.99",
        :qtelivre => "9.99",
        :montant => "9.99",
        :numero_prise => 1,
        :type => false,
        :etat => "Etat"
      )
    ])
  end

  it "renders a list of prestationlignes" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Etat".to_s, :count => 2
  end
end

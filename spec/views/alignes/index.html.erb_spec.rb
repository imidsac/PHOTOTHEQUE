require 'rails_helper'

RSpec.describe "alignes/index", :type => :view do
  before(:each) do
    assign(:alignes, [
      Aligne.create!(
        :achat => nil,
        :qte => "9.99",
        :qtelivre => "9.99",
        :montant => "9.99",
        :etat => "Etat"
      ),
      Aligne.create!(
        :achat => nil,
        :qte => "9.99",
        :qtelivre => "9.99",
        :montant => "9.99",
        :etat => "Etat"
      )
    ])
  end

  it "renders a list of alignes" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Etat".to_s, :count => 2
  end
end

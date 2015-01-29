require 'rails_helper'

RSpec.describe "retourelogs/index", :type => :view do
  before(:each) do
    assign(:retourelogs, [
      Retourelog.create!(
        :produit => nil,
        :qte => "9.99",
        :optionretoure => nil,
        :achat => nil,
        :vente => nil,
        :motif => "Motif",
        :user => nil
      ),
      Retourelog.create!(
        :produit => nil,
        :qte => "9.99",
        :optionretoure => nil,
        :achat => nil,
        :vente => nil,
        :motif => "Motif",
        :user => nil
      )
    ])
  end

  it "renders a list of retourelogs" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Motif".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

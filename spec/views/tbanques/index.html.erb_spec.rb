require 'rails_helper'

RSpec.describe "tbanques/index", :type => :view do
  before(:each) do
    assign(:tbanques, [
      Tbanque.create!(
        :banque => nil,
        :type_rv => "Type Rv",
        :montant => "9.99",
        :porteur => "Porteur"
      ),
      Tbanque.create!(
        :banque => nil,
        :type_rv => "Type Rv",
        :montant => "9.99",
        :porteur => "Porteur"
      )
    ])
  end

  it "renders a list of tbanques" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Type Rv".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Porteur".to_s, :count => 2
  end
end

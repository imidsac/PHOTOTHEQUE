require 'rails_helper'

RSpec.describe "caisses/index", :type => :view do
  before(:each) do
    assign(:caisses, [
      Caisse.create!(
        :paiement => "9.99",
        :font => "9.99"
      ),
      Caisse.create!(
        :paiement => "9.99",
        :font => "9.99"
      )
    ])
  end

  it "renders a list of caisses" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end

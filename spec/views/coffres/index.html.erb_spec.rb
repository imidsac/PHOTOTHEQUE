require 'rails_helper'

RSpec.describe "coffres/index", :type => :view do
  before(:each) do
    assign(:coffres, [
      Coffre.create!(
        :paiement => "9.99",
        :font => "9.99"
      ),
      Coffre.create!(
        :paiement => "9.99",
        :font => "9.99"
      )
    ])
  end

  it "renders a list of coffres" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "tcoffres/index", :type => :view do
  before(:each) do
    assign(:tcoffres, [
      Tcoffre.create!(
        :beneficier => "Beneficier",
        :type_tc => "Type Tc"
      ),
      Tcoffre.create!(
        :beneficier => "Beneficier",
        :type_tc => "Type Tc"
      )
    ])
  end

  it "renders a list of tcoffres" do
    render
    assert_select "tr>td", :text => "Beneficier".to_s, :count => 2
    assert_select "tr>td", :text => "Type Tc".to_s, :count => 2
  end
end

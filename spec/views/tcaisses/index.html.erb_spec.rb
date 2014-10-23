require 'rails_helper'

RSpec.describe "tcaisses/index", :type => :view do
  before(:each) do
    assign(:tcaisses, [
      Tcaisse.create!(
        :crencier => "Crencier",
        :type => "Type"
      ),
      Tcaisse.create!(
        :crencier => "Crencier",
        :type => "Type"
      )
    ])
  end

  it "renders a list of tcaisses" do
    render
    assert_select "tr>td", :text => "Crencier".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end

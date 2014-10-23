require 'rails_helper'

RSpec.describe "boutiques/index", :type => :view do
  before(:each) do
    assign(:boutiques, [
      Boutique.create!(
        :name => "Name",
        :phone => "Phone",
        :address => "MyText"
      ),
      Boutique.create!(
        :name => "Name",
        :phone => "Phone",
        :address => "MyText"
      )
    ])
  end

  it "renders a list of boutiques" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

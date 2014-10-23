require 'rails_helper'

RSpec.describe "cadres/index", :type => :view do
  before(:each) do
    assign(:cadres, [
      Cadre.create!(
        :numerobaguete => "Numerobaguete",
        :info => "MyText"
      ),
      Cadre.create!(
        :numerobaguete => "Numerobaguete",
        :info => "MyText"
      )
    ])
  end

  it "renders a list of cadres" do
    render
    assert_select "tr>td", :text => "Numerobaguete".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

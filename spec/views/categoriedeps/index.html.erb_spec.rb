require 'rails_helper'

RSpec.describe "categoriedeps/index", :type => :view do
  before(:each) do
    assign(:categoriedeps, [
      Categoriedep.create!(
        :name => "Name",
        :description => "Description"
      ),
      Categoriedep.create!(
        :name => "Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of categoriedeps" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end

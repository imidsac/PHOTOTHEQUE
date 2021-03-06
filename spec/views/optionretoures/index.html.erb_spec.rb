require 'rails_helper'

RSpec.describe "optionretoures/index", :type => :view do
  before(:each) do
    assign(:optionretoures, [
      Optionretoure.create!(
        :name => "Name",
        :description => "MyText",
        :user => nil
      ),
      Optionretoure.create!(
        :name => "Name",
        :description => "MyText",
        :user => nil
      )
    ])
  end

  it "renders a list of optionretoures" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end

require 'rails_helper'

RSpec.describe "formatphotos/index", :type => :view do
  before(:each) do
    assign(:formatphotos, [
      Formatphoto.create!(
        :dimention => "Dimention",
        :info => "MyText"
      ),
      Formatphoto.create!(
        :dimention => "Dimention",
        :info => "MyText"
      )
    ])
  end

  it "renders a list of formatphotos" do
    render
    assert_select "tr>td", :text => "Dimention".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

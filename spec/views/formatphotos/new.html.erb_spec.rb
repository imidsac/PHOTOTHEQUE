require 'rails_helper'

RSpec.describe "formatphotos/new", :type => :view do
  before(:each) do
    assign(:formatphoto, Formatphoto.new(
      :dimention => "MyString",
      :info => "MyText"
    ))
  end

  it "renders new formatphoto form" do
    render

    assert_select "form[action=?][method=?]", formatphotos_path, "post" do

      assert_select "input#formatphoto_dimention[name=?]", "formatphoto[dimention]"

      assert_select "textarea#formatphoto_info[name=?]", "formatphoto[info]"
    end
  end
end

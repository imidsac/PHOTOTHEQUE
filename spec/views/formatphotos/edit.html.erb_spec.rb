require 'rails_helper'

RSpec.describe "formatphotos/edit", :type => :view do
  before(:each) do
    @formatphoto = assign(:formatphoto, Formatphoto.create!(
      :dimention => "MyString",
      :info => "MyText"
    ))
  end

  it "renders the edit formatphoto form" do
    render

    assert_select "form[action=?][method=?]", formatphoto_path(@formatphoto), "post" do

      assert_select "input#formatphoto_dimention[name=?]", "formatphoto[dimention]"

      assert_select "textarea#formatphoto_info[name=?]", "formatphoto[info]"
    end
  end
end

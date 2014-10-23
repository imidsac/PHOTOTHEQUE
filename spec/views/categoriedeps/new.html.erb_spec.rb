require 'rails_helper'

RSpec.describe "categoriedeps/new", :type => :view do
  before(:each) do
    assign(:categoriedep, Categoriedep.new(
      :name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new categoriedep form" do
    render

    assert_select "form[action=?][method=?]", categoriedeps_path, "post" do

      assert_select "input#categoriedep_name[name=?]", "categoriedep[name]"

      assert_select "input#categoriedep_description[name=?]", "categoriedep[description]"
    end
  end
end

require 'rails_helper'

RSpec.describe "optionretoures/new", :type => :view do
  before(:each) do
    assign(:optionretoure, Optionretoure.new(
      :name => "MyString",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders new optionretoure form" do
    render

    assert_select "form[action=?][method=?]", optionretoures_path, "post" do

      assert_select "input#optionretoure_name[name=?]", "optionretoure[name]"

      assert_select "textarea#optionretoure_description[name=?]", "optionretoure[description]"

      assert_select "input#optionretoure_user_id[name=?]", "optionretoure[user_id]"
    end
  end
end

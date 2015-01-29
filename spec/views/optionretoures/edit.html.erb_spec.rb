require 'rails_helper'

RSpec.describe "optionretoures/edit", :type => :view do
  before(:each) do
    @optionretoure = assign(:optionretoure, Optionretoure.create!(
      :name => "MyString",
      :description => "MyText",
      :user => nil
    ))
  end

  it "renders the edit optionretoure form" do
    render

    assert_select "form[action=?][method=?]", optionretoure_path(@optionretoure), "post" do

      assert_select "input#optionretoure_name[name=?]", "optionretoure[name]"

      assert_select "textarea#optionretoure_description[name=?]", "optionretoure[description]"

      assert_select "input#optionretoure_user_id[name=?]", "optionretoure[user_id]"
    end
  end
end

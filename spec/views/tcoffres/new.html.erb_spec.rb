require 'rails_helper'

RSpec.describe "tcoffres/new", :type => :view do
  before(:each) do
    assign(:tcoffre, Tcoffre.new(
      :beneficier => "MyString",
      :type_tc => "MyString"
    ))
  end

  it "renders new tcoffre form" do
    render

    assert_select "form[action=?][method=?]", tcoffres_path, "post" do

      assert_select "input#tcoffre_beneficier[name=?]", "tcoffre[beneficier]"

      assert_select "input#tcoffre_type_tc[name=?]", "tcoffre[type_tc]"
    end
  end
end

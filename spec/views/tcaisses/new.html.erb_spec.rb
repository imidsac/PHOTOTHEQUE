require 'rails_helper'

RSpec.describe "tcaisses/new", :type => :view do
  before(:each) do
    assign(:tcaisse, Tcaisse.new(
      :crencier => "MyString",
      :type => ""
    ))
  end

  it "renders new tcaisse form" do
    render

    assert_select "form[action=?][method=?]", tcaisses_path, "post" do

      assert_select "input#tcaisse_crencier[name=?]", "tcaisse[crencier]"

      assert_select "input#tcaisse_type[name=?]", "tcaisse[type]"
    end
  end
end

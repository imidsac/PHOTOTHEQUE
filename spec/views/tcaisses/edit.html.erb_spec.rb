require 'rails_helper'

RSpec.describe "tcaisses/edit", :type => :view do
  before(:each) do
    @tcaisse = assign(:tcaisse, Tcaisse.create!(
      :crencier => "MyString",
      :type => ""
    ))
  end

  it "renders the edit tcaisse form" do
    render

    assert_select "form[action=?][method=?]", tcaisse_path(@tcaisse), "post" do

      assert_select "input#tcaisse_crencier[name=?]", "tcaisse[crencier]"

      assert_select "input#tcaisse_type[name=?]", "tcaisse[type]"
    end
  end
end

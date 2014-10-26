require 'rails_helper'

RSpec.describe "tcoffres/edit", :type => :view do
  before(:each) do
    @tcoffre = assign(:tcoffre, Tcoffre.create!(
      :beneficier => "MyString",
      :type_tc => "MyString"
    ))
  end

  it "renders the edit tcoffre form" do
    render

    assert_select "form[action=?][method=?]", tcoffre_path(@tcoffre), "post" do

      assert_select "input#tcoffre_beneficier[name=?]", "tcoffre[beneficier]"

      assert_select "input#tcoffre_type_tc[name=?]", "tcoffre[type_tc]"
    end
  end
end
